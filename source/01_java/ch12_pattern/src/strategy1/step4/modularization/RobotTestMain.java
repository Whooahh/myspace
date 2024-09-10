package strategy1.step4.modularization;

import strategy1.step4.interfaces.FlyHigh;
import strategy1.step4.interfaces.KnifePlay;

public class RobotTestMain {
	public static void main(String[] args) {
		SuperRobot    superRobot    = new SuperRobot();
		StandardRobot standardRobot = new StandardRobot();
		LowRobot      lowRobot      = new LowRobot();
		Robot[] robots = {superRobot, standardRobot, lowRobot};
		for(Robot robot : robots) {
			robot.shape();
			robot.actionWalk();
			robot.actionRun();
			robot.actionFly();
			robot.actionMssile();
			robot.actionKnife();
		}//for
		System.out.println("SuperRobot의 나는 부품을 높~~~~~~~이 나는 기능으로 업그레드");
		superRobot.setFly(new FlyHigh());
		superRobot.shape();
		superRobot.actionFly();
		robots[0].actionFly();
		System.out.println("lowRobot의 knife부품을 '장난감 검이 있습니다'기능으로 업그레이드");
		lowRobot.setKnife(new KnifePlay());
		lowRobot.shape();
		lowRobot.actionKnife();
	}//main
}//class






