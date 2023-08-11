package kr.or.ddit.mapper.kmw;

import java.util.List;

import kr.or.ddit.vo.kmw.ReviewVO;

public interface ReviewMapper {

	int insertReview(ReviewVO reviewVO);

	List<ReviewVO> reviewList(String bookNo);

	int reviewCnt(String bookNo);

	int reviewTotalScore(String bookNo);

	List<ReviewVO> scrList(String bookNo);

	int deleteReview(ReviewVO rVO);

	String selectUaNo(ReviewVO rVO);

	ReviewVO reviewAvg(String book_no);

}
