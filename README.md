# Hopenet #

<div align="center">
  <img src="https://i.imgur.com/K7jhHOg.png" width="380"><br><br>
</div>

**Hopenet** is an accurate and easy to use head pose estimation network. Models have been trained on the 300W-LP dataset and have been tested on real data with good qualitative performance.

For details about the method and quantitative results please check the [paper](https://arxiv.org/abs/1710.00925).

<div align="center">
<img src="conan-cruise.gif" /><br><br>
</div>

**new** [GoT trailer example video](https://youtu.be/OZdOrSLBQmI)

**new** [Conan-Cruise-Car example video](https://youtu.be/Bz6eF4Nl1O8)

Dependencies:
```
pip install numpy
pip install matplotlib
pip install opencv-python==3.4.0.14
pip install pandas
pip install torch torchvision
pip install scipy
pip install scikit-image
pip install dlib
```
To make our life easier there is a `setup_env.sh` which should be run within the repository. This script creates a virtual python environment and will install the requirements.
After that activate it in your terminal `$ source my_py_env/bin/activate` (HINT: this environment can also be used as interpreter for `PyCharm`)


Training scripts still have some issues and will be fixed soon.

To test on a video using dlib face detections (center of head will be jumpy, and  [dlib-models](https://github.com/davisking/dlib-models) (e.g. `mmod_human_face_detector`) and the trained model [300W-LP, alpha 2](https://drive.google.com/open?id=16OZdRULgUpceMKZV6U9PNFiigfjezsCY)  will be needed):
```
python code/test_on_video_dlib.py --snapshot PATH_OF_SNAPSHOT --face_model PATH_OF_DLIB_MODEL --video PATH_OF_VIDEO --output_string STRING_TO_APPEND_TO_OUTPUT --n_frames N_OF_FRAMES_TO_PROCESS --fps FPS_OF_SOURCE_VIDEO
```

Or use your webcam:
```
python code/test_on_video_dlib.py --snapshot ./hopenet_alpha2.pkl --face_model ./mmod_human_face_detector.dat  --output_string web  --n_frames 0 --fps 30 --width 320 --height 240 --video webcam
```

To test on a video using your own face detections (we recommend using [dockerface](https://github.com/natanielruiz/dockerface), center of head will be smoother):
```
python code/test_on_video_dockerface.py --snapshot PATH_OF_SNAPSHOT --video PATH_OF_VIDEO --bboxes FACE_BOUNDING_BOX_ANNOTATIONS --output_string STRING_TO_APPEND_TO_OUTPUT --n_frames N_OF_FRAMES_TO_PROCESS --fps FPS_OF_SOURCE_VIDEO
```
Face bounding box annotations should be in Dockerface format (n_frame x_min y_min x_max y_max confidence).

Pre-trained models:

[300W-LP, alpha 1](https://drive.google.com/open?id=1EJPu2sOAwrfuamTitTkw2xJ2ipmMsmD3)

[300W-LP, alpha 2](https://drive.google.com/open?id=16OZdRULgUpceMKZV6U9PNFiigfjezsCY)

[300W-LP, alpha 1, robust to image quality](https://drive.google.com/open?id=1m25PrSE7g9D2q2XJVMR6IA7RaCvWSzCR)

For more information on what alpha stands for please read the paper. First two models are for validating paper results, if used on real data we suggest using the last model as it is more robust to image quality and blur and gives good results on video.

Please keep in mind that testing instructions to reproduce the paper results will be added very soon.

This work is still in progress - we are obtaining better results and will also be updating this README with instructions. Please open an issue if you have an problem.

Some things that will be added:
* Test script for images
* Docker image
* Instructions for all scripts
* Better and better models
* Videos and example images!

If you find Hopenet useful in your research please consider citing:

```
@article{DBLP:journals/corr/abs-1710-00925,
  author    = {Nataniel Ruiz and
               Eunji Chong and
               James M. Rehg},
  title     = {Fine-Grained Head Pose Estimation Without Keypoints},
  journal   = {CoRR},
  volume    = {abs/1710.00925},
  year      = {2017},
  url       = {http://arxiv.org/abs/1710.00925},
  archivePrefix = {arXiv},
  eprint    = {1710.00925},
  timestamp = {Wed, 01 Nov 2017 19:05:43 +0100},
  biburl    = {http://dblp.org/rec/bib/journals/corr/abs-1710-00925},
  bibsource = {dblp computer science bibliography, http://dblp.org}
}
```

*Nataniel Ruiz*, *Eunji Chong*, *James M. Rehg*

Georgia Institute of Technology
