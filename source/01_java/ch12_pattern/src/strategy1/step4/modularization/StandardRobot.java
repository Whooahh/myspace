package strategy1.step4.modularization;
import strategy1.step4.interfaces.*;
public class StandardRobot extends Robot {
	private FlyImpl     fly;
	private MissileImpl missile;
	private KnifeImpl   knife;
	public StandardRobot() {
		setFly(new FlyNo()); //fly = new FlyNo();
		setMissile(new MissileYes());
		setKnife(new KnifeWood());
	}
	@Override
	public void actionFly() {fly.fly();}
	@Override
	public void actionMssile() {missile.missile();}
	@Override
	public void actionKnife() {knife.knife();}
	public void setFly(FlyImpl fly) {this.fly = fly;}
	public void setMissile(MissileImpl missile) {this.missile = missile;}
	public void setKnife(KnifeImpl knife) {this.knife = knife;}	
}



















