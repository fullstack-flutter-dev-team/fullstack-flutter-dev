/**
 * ==============================================
 *  IDAO.java
 *   - 인터페이스
 * ==============================================
 */

package com.test.spr;

import java.sql.SQLException;
import java.util.List;

public interface IDAO
{
    public List<MemberDTO> list() throws ClassNotFoundException, SQLException;

}
