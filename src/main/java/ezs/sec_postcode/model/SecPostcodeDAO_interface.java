package ezs.sec_postcode.model;

import java.util.List;

public interface SecPostcodeDAO_interface {
        public void insert(SecPostcodeVO secPostcodeVO);
        public void delete(Integer shPostCode);
        public void update(SecPostcodeVO secPostcodeVO);
        public SecPostcodeVO findByPrimaryKey(Integer shPostCode);
        public List<SecPostcodeVO> getAll();

}
