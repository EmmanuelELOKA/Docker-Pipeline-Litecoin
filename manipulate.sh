image_id=$(aws ecr describe-repositories | awk -F'"' 'NR==7{print $4}')

if [ -z "$image_id" ]
then
      echo "No image found"
else
      sed -i "s~image: $PARTITION_COLUMN.*~image: $image_id~" statefulset.yml
fi