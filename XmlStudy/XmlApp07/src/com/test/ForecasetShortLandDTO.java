package com.test;

public class ForecasetShortLandDTO
{
    // <item>
    //     <announceTime>202511051100</announceTime> -- 발표시간
    //     <numEf>0</numEf>                          -- 발표번호
    //     <regId>11B10101</regId>         ------------ 예보구역코드
    //     <rnSt>0</rnSt>  ---------------------------- 강수활률
    //     <rnYn>0</rnYn> 
    //     <ta>18</ta>  ------------------------------- 예상기온
    //     <wd1>N</wd1> ------------------------------- 풍향
    //     <wd2>NE</wd2>
    //     <wdTnd>1</wdTnd>
    //     <wf>맑음</wf> ------------------------------ 날씨
    //     <wfCd>DB01</wfCd> -------------------------- 하늘상태
    //     <wsIt/>
    // </item>

    // 주요 요소 구성
    // numEf(발표번호), regId(예보구역코드), rnSt(강수확률), rnYn(강수형태), ta(예상기온)
    // wd1(풍향), wf(날씨), wfCd(하늘상태)
    // img(날씨이미지), skyImg(하늘상태이미지);
    private String numEf, regId, rnSt, rnYn, ta, wd1, wf, wfCd, img, skyImg;
    //-- numEf   → 발표번호(발표시간기준)
    //-- regId   → 예보구역코드
    //-- rnSt    → 강수확률
    //-- rnYn    → 강수형태
    //-- ta    → 예상기온
    //-- wd1    → 강수형태
    //-- wf    → 날씨
    //-- wfCd    → 하늘상태
    //-- img    → 날씨이미지
    //-- skyImg    → 하늘상태이미지

    public String getNumEf()
    {
        return numEf;
    }

    public void setNumEf(String numEf)
    {
        this.numEf = numEf;
    }

    public String getRegId()
    {
        return regId;
    }

    public void setRegId(String regId)
    {
        this.regId = regId;
    }

    public String getRnSt()
    {
        return rnSt;
    }

    public void setRnSt(String rnSt)
    {
        this.rnSt = rnSt;
    }

    public String getRnYn()
    {
        return rnYn;
    }

    public void setRnYn(String rnYn)
    {
        this.rnYn = rnYn;
    }

    public String getTa()
    {
        return ta;
    }

    public void setTa(String ta)
    {
        this.ta = ta;
    }

    public String getWd1()
    {
        return wd1;
    }

    public void setWd1(String wd1)
    {
        this.wd1 = wd1;
    }

    public String getWf()
    {
        return wf;
    }

    public void setWf(String wf)
    {
        this.wf = wf;
    }

    public String getWfCd()
    {
        return wfCd;
    }

    public void setWfCd(String wfCd)
    {
        this.wfCd = wfCd;
    }

    public String getImg()
    {
        return img;
    }

    public void setImg(String img)
    {
        this.img = img;
    }

    public String getSkyImg()
    {
        return skyImg;
    }

    public void setSkyImg(String skyImg)
    {
        this.skyImg = skyImg;
    }
}
