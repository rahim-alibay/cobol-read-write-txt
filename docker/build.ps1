# PARAMETERS
$DOCKER_IMAGE_NAME="UBUNTU_TUTO_COBOL_1"

# FUNCTION
function F_Check_If_File_Exist{
    param ($filename)
    $file_list = Get-ChildItem -File | select Name
    $result=0
    for ($i=0; $i -lt $file_list.length; $i++) {
        if($file_list[$i] -eq $filename)
        {
            $result=1
        }
    }
    return $result
}

function F_Docker_Clean{
    param ($image_name)
    $list="$(docker ps --all --quiet --filter=name="$image_name")"
    if($list -ne ""){
        echo "Stop and Delete : "
        docker stop $list
        docker rm $list
    }
}

function F_Build_Image{
    param ($dockerfile_name,$image_name)
    if($(F_Check_If_File_Exist $dockerfile_name) -eq 1){
        echo "There is a Dockerfile"
        docker build -t $image_name .
        echo "Image Builded"        
    }
    else{
        echo "NO a Dockerfile !"
        Break
    }
}

function F_Compose_Containers{
    param ($docker_compose_filename)
    if($(F_Check_If_File_Exist $docker_compose_filename) -eq 1){
        echo "There is a Docker Compose File"
        docker-compose -f "docker-compose.yml" up -d
        echo "Container created"   
    }
    else{
        echo "There is a Docker Compose File !"
        Break
    }
}

# MAIN
F_Docker_Clean("DOCKER_IMAGE_NAME")
F_Build_Image ("dockerfile","DOCKER_IMAGE_NAME")
F_Compose_Containers("docker-compose.yml")

# END
pause

