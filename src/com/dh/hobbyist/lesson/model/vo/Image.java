package com.dh.hobbyist.lesson.model.vo;

public class Image {
	private int imageCode;
	private String imageRoute;
	private String imageName;
	private String imageType;
	private int imageFkPk;
	private int imageMain;
	
	public Image() {}

	public Image(int imageCode, String imageRoute, String imageName, String imageType, int imageFkPk, int imageMain) {
		super();
		this.imageCode = imageCode;
		this.imageRoute = imageRoute;
		this.imageName = imageName;
		this.imageType = imageType;
		this.imageFkPk = imageFkPk;
		this.imageMain = imageMain;
	}

	public int getImageCode() {
		return imageCode;
	}

	public void setImageCode(int imageCode) {
		this.imageCode = imageCode;
	}

	public String getImageRoute() {
		return imageRoute;
	}

	public void setImageRoute(String imageRoute) {
		this.imageRoute = imageRoute;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getImageType() {
		return imageType;
	}

	public void setImageType(String imageType) {
		this.imageType = imageType;
	}

	public int getImageFkPk() {
		return imageFkPk;
	}

	public void setImageFkPk(int imageFkPk) {
		this.imageFkPk = imageFkPk;
	}

	public int getImageMain() {
		return imageMain;
	}

	public void setImageMain(int imageMain) {
		this.imageMain = imageMain;
	}

	@Override
	public String toString() {
		return "Image [imageCode=" + imageCode + ", imageRoute=" + imageRoute + ", imageName=" + imageName
				+ ", imageType=" + imageType + ", imageFkPk=" + imageFkPk + ", imageMain=" + imageMain + "]";
	}
	
	
}
