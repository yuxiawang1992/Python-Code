# Name: SpatialJoin_AddField
# Description: Join attributes
# Requirements: os module

# Import system modules
import arcpy
import os

# Set local variables
workspace = "F:\\data_test\\fahui_wang\\"
outWorkspace = "F:\\data_test\\fahui_wang\\"

targetFeatures = os.path.join(workspace, "d_04")
joinFeatures = os.path.join(workspace, "d_05")

outfc = os.path.join(outWorkspace, "dd05")

# Create a new fieldmappings and add the two input feature classes.
fieldmappings = arcpy.FieldMappings()
fieldmappings.addTable(targetFeatures)
fieldmappings.addTable(joinFeatures)

# First get the POP1990 fieldmap. POP1990 is a field in the cities feature class.
# The output will have the states with the attributes of the cities. Setting the
# field's merge rule to mean will aggregate the values for all of the cities for
# each state into an average value. The field is also renamed to be more appropriate
# for the output.
sumFieldIndex = fieldmappings.findFieldMapIndex("OUTPUT")
fieldmap = fieldmappings.getFieldMap(sumFieldIndex)

# Get the output field's properties as a field object
field = fieldmap.outputField

# Rename the field and pass the updated field object back into the field map
field.name = "d_05"
field.aliasName = "d_05"
fieldmap.outputField = field

# Run the Spatial Join tool, using the defaults for the join operation and join type
arcpy.SpatialJoin_analysis(targetFeatures, joinFeatures, outfc, "#", "#", fieldmappings)