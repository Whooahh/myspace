package strategy2.modularization;
import strategy2.interfaces.EngineLow;
import strategy2.interfaces.FuelDiesel;
import strategy2.interfaces.Km20;
public class Casper extends Car {
	public Casper() {
		// engine, km, fuel setting
		setEngine(new EngineLow());
		setKm(new Km20());
		setFuel(new FuelDiesel());
	}
	@Override
	public void shape() {
		System.out.println("★ 캐스퍼 차량은 문, 시트, 핸들로 이루어져 있습니다");
	}
}