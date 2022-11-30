##
# Java Makefile
#
# @author: Zarkli Leonardo
# @version: 1.0
#
# This file use variables(interact with sed)
# variable format: #{}#

all: compile run

compile:
	mvn -q package

run: 
	# java -cp "target/PacMan-1.0-SNAPSHOT.jar:libs/COMP2011J.Game.Engine.jar" PacMan.GameStart
	java -cp "target/#{packageName}#-1.0-SNAPSHOT.jar" #{packageName}#.App

.PHONY: clean
clean:
	mvn clean


# end
