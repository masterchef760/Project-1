#!/bin/bash
awk '{print $1, $2, $5, $6}' 0315_Dealer_schedule | grep -i $1 | grep -i $2 >> Dealers_working_during_losses

