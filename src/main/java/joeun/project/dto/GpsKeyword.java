package joeun.project.dto;

public class GpsKeyword {
	private double x;
	private double y;
	private String radius;
	private String keyword;
	
	public GpsKeyword() {	}
	public GpsKeyword(double x, double y, String radius, String keyword) {
		super();
		this.x = x;
		this.y = y;
		this.radius = radius;
		this.keyword = keyword;
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	public String getRadius() {
		return radius;
	}
	public void setRadius(String radius) {
		this.radius = radius;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "GpsKeyword [x=" + x + ", y=" + y + ", radius=" + radius + ", keyword=" + keyword + "]";
	}
	




}
