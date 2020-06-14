#!/bin/bash
bness=`brightness -l | grep brightness | awk '{print $4}'`
prevbness=`cat bness.var`

if [ "$bness" == "0.000000" ]; then
	brightness $prevbness
else
	echo $bness > bness.var
 	brightness 0 	
fi
