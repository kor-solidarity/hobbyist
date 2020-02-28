package com.dh.hobbyist.lesson.model.vo;

public class Image {
	private int imageCode;          //이미지 관리번호
	private String imageRoute;      //이미지 경로
	private String imageName;       //이미지 파일명
	private String imageType;       //이미지 구분 
	private int imageFkPk;          //해당 구분 내의 테이블 관리 번호
	private int imageMain;          //메인사진 여부
	
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
