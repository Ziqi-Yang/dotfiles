##
# Java Makefile
#
# @author: Zarkli Leonardo
# @version: 1.0
#

export GDK_SCALE=2


all: compile

compile:
	mvn package
	java -cp "target/PacMan-1.0-SNAPSHOT.jar:libs/COMP2011J.Game.Engine.jar" PacMan.GameStart

clean:
	mvn clean


# end
