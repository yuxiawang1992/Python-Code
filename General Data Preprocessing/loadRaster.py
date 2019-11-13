#!/usr/bin/env python 3.4.3
# -*- coding: utf-8 -*-
"""
Created on 03 17 2016
@author: wangyuxia
"""
import sys
sys.path.append("D:\\Program Files\\QGIS Pisa\\")
from qgis.core import *

# supply path to qgis install location
QgsApplication.setPrefixPath("/path/to/qgis/installation", True)

# create a reference to the QgsApplication, setting the
# second argument to False disables the GUI
qgs = QgsApplication([], False)

# load providers
qgs.initQgis()

# Write your code here to load some layers, use processing algorithms, etc.

# When your script is complete, call exitQgis() to remove the provider and
# layer registries from memory
qgs.exitQgis()

from pyproj import Proj

path = "E:\\test for qgis\\HourScale\\"

#for file in os.listdir(path)
        
fileName = path+"N0200"
fileInfo = QFileInfo(fileName)
baseName = fileInfo.baseName()
rlayer = QgsRasterLayer(fileName, baseName)
if not rlayer.isValid():
    print("Layer failed to load!")
  
QgsMapLayerRegistry.instance().addMapLayer(rlayer)
