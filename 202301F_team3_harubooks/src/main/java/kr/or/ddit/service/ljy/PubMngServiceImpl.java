package kr.or.ddit.service.ljy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ljy.PubMngMapper;
import kr.or.ddit.vo.UserAuthVO;
import kr.or.ddit.vo.ljy.PubMngVO;

@Service
public class PubMngServiceImpl implements PubMngService {
	
	@Autowired
	private PubMngMapper pubMapper;
	
	@Override
	public List<PubMngVO> pubList(PubMngVO pubMngVO) {
		return pubMapper.pubList(pubMngVO);
	}

	@Override
	public String insertPub(PubMngVO pubMngVO) {
		// 전체 사용자 insert
		pubMapper.insertAllEmplyr(pubMngVO);
		// 권한 insert
		pubMapper.insertAuthor(pubMngVO);
		// 출판사 insert
		int cnt = pubMapper.insertPub(pubMngVO);
		// user insert
		pubMapper.insertUsers(pubMngVO);
		// member insert
		pubMapper.insertMember(pubMngVO);
		String res = "";
		if(cnt >0){
			res = "success";
		} else {
			res = "fail";
		}
		return res;
	}

	@Override
	public int pubListCnt() {
		return pubMapper.pubListCnt();
	}

}
