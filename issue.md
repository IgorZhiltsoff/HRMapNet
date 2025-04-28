I am trying to build HRMapNet on wsl (`5.15.167.4-microsoft-standard-WSL2`; my Windows is `Microsoft Windows [Version 10.0.19045.5737]`).


Following the installation guide (https://github.com/HXMap/HRMapNet/blob/master/docs/install.md), 
I run into problems on step (g)

When I run 
```bash
cd /path/to/HRMapNet/mmdetection3d
python setup.py develop
```

I get

```
Installed /root/anaconda3/envs/hrmapnet-228/lib/python3.8/site-packages/tensorboard-2.19.0-py3.8.egg
Searching for scikit-image
Reading https://pypi.org/simple/scikit-image/
Downloading https://files.pythonhosted.org/packages/c7/a8/3c0f256012b93dd2cb6fda9245e9f4bff7dc0486880b248005f15ea2255e/scikit_image-0.25.2.tar.gz#sha256=e5a37e6cd4d0c018a7a55b9d601357e3382826d3888c10d0213fc63bff977dde
Best match: scikit-image 0.25.2
Processing scikit_image-0.25.2.tar.gz
zip_safe flag not set; analyzing archive contents...
error: Couldn't find a setup script in /tmp/easy_install-rmj7awdm/scikit_image-0.25.2.tar.gz
```

If I install scikit-image with pip

```
pip install scikit-image
```

I get a lot of version conflicts:

```
ERROR: pip's dependency resolver does not currently take into account all the packages that are installed. This behaviour is the source of the following dependency conflicts.
mmdet3d 0.17.2 requires lyft_dataset_sdk, which is not installed.
mmdet3d 0.17.2 requires numba==0.48.0, which is not installed.
mmdet3d 0.17.2 requires nuscenes-devkit, which is not installed.
mmdet3d 0.17.2 requires plyfile, which is not installed.
mmdet3d 0.17.2 requires networkx<2.3,>=2.2, but you have networkx 3.1 which is incompatible.
mmdet3d 0.17.2 requires numpy<1.20.0, but you have numpy 1.24.4 which is incompatible.
```

I tried resolving them manually with no success.

I also had to install cuda with conda:
```bash
conda install cuda -c nvidia
```

-----------

# Other attempts

Instead of running 

```bash
cd /path/to/HRMapNet/mmdetection3d
python setup.py develop
```

I also tried running 
```bash
cd /path/to/HRMapNet/mmdetection3d
python -m pip install --no-cache-dir -e .
```

This allowed me to finish installation without any errors (I did not change the rest of the steps),
 but when I tried running the tests
 ```bash 
./tools/dist_test_map.sh ./projects/configs/maptr/hrmapnet_maptrv2_nusc_r50_24ep.py ./path/to/ckpts.pth 1
 ```

 I got an error

 ```
 Traceback (most recent call last):
  File "./tools/test.py", line 19, in <module>
    from projects.mmdet3d_plugin.datasets.builder import build_dataloader
  File "/mnt/c/Users/Игорь/hrmapnet228/projects/mmdet3d_plugin/__init__.py", line 5, in <module>
    from .datasets.pipelines import (
  File "/mnt/c/Users/Игорь/hrmapnet228/projects/mmdet3d_plugin/datasets/__init__.py", line 7, in <module>
    from .av2_offlinemap_dataset import CustomAV2OfflineLocalMapDataset
  File "/mnt/c/Users/Игорь/hrmapnet228/projects/mmdet3d_plugin/datasets/av2_offlinemap_dataset.py", line 26, in <module>
    from av2.datasets.sensor.av2_sensor_dataloader import AV2SensorDataLoader
  File "/root/anaconda3/envs/hrmapnet-new/lib/python3.8/site-packages/av2/datasets/sensor/av2_sensor_dataloader.py", line 12, in <module>
    import av2.geometry.geometry as geometry_utils
  File "/root/anaconda3/envs/hrmapnet-new/lib/python3.8/site-packages/av2/geometry/geometry.py", line 11, in <module>
    from av2.utils.typing import NDArrayBool, NDArrayFloat, NDArrayInt
  File "/root/anaconda3/envs/hrmapnet-new/lib/python3.8/site-packages/av2/utils/typing.py", line 11, in <module>
    import numpy.typing as npt
ModuleNotFoundError: No module named 'numpy.typing'
 ```

It is due to numpy version being <1.20.0. I tried other versions, but none worked.

I also had to install cuda with conda:
```bash
conda install cuda -c nvidia
```

-------------------------------------

# Question 

Can you please provide the exact packages with version that you have in the environment in which hrmapnet runs? I would like to install them manually



