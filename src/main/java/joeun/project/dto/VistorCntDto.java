package joeun.project.dto;

public class VistorCntDto {
	private Integer index_cnt;
	private Integer nearbolgguri_cnt;
	
	public VistorCntDto() {	}

	public VistorCntDto(Integer index_cnt, Integer nearbolgguri_cnt) {
		super();
		this.index_cnt = index_cnt;
		this.nearbolgguri_cnt = nearbolgguri_cnt;
	}

	public Integer getIndex_cnt() {
		return index_cnt;
	}

	public void setIndex_cnt(Integer index_cnt) {
		this.index_cnt = index_cnt;
	}

	public Integer getNearbolgguri_cnt() {
		return nearbolgguri_cnt;
	}

	public void setNearbolgguri_cnt(Integer nearbolgguri_cnt) {
		this.nearbolgguri_cnt = nearbolgguri_cnt;
	}

	@Override
	public String toString() {
		return "VistorCntDto [index_cnt=" + index_cnt + ", nearbolgguri_cnt=" + nearbolgguri_cnt + "]";
	}
	

}
