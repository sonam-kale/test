Feature: Stepping Through Cycle Utilities

@wip @public
Scenario: Calulating Number of Stairs
#############################################################
# Description: This scenario multiplies the number of stairs
#  by the number of floors and returns the results
# Inputs:
# 	Required:
# 		floors - The number of floors a building has. To be multiplied by steps
# 		steps - The number of stairs in a floor. To be multiplied by floors
# Outputs:
# 	floors - the number of stairs in a given building
#############################################################
Given I assign $floors to variable "total_steps"
When I multiply variable "total_steps" by $steps

Scenario Outline: Reading from csv
CSV Examples: dataset\data.csv
# Given I assign <floor> to variable "floor"
# and I assign <step> to variable "step"
Given I assign "" to variable "floor"
and I assign "" to variable "step"
and i assign chevron variables "floor,step" to dollar variables adding prefix "cycle_"
and I convert string variable "cycle_floor" to integer variable "floor"
And i convert string variable "cycle_step" to integer variable "step"
And i echo $floor
When I multiply variable "floor" by $step
and I echo $floor







