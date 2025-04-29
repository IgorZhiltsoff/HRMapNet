115  mkdir data\
  116  mv Downloads/can_bus.zip data
  117  mv Downloads/nuScenes-map-expansion-v1.3.zip 
  118  mv Downloads/nuScenes-map-expansion-v1.3.zip  data
  119  mv Downloads/v1.0-mini.tgz data
  120  mv data hrmpnt/
  121  cd hrmpnt/
  122  ls
  123  cd data
  124  ls
  125  mv * zips/
  126  mkdir zips
  127  mv *\.* zips
  128  ls
  129  mkdir nuscenes
  130  cd ..
  131  code .
  132  code ../HRMapNet/
  133  cd data
  134  ls
  135  cd nuscenes/
  136  man tar
  137  tar -xzvf ../zips/v1.0-mini.tgz -C .
  138  ls
  139  cp v1.0-mini v1.0-trainval -r
  140  cp v1.0-mini v1.0-test -r
  141  ls
  142  unzip ../zips/can_bus.zip 
  143  ls
  144  mv can_bus ..
  145  cd ..
  146  ls
  147  cd nuscenes/maps/
  148  ls
  149  unzip ../../zips/nuScenes-map-expansion-v1.3.zip
