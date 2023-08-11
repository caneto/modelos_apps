import 'package:learnkuy/models/county_list_model.dart';

List<String> get countriesName => countriesList.map((e) => e.name).toList();

List<CountriesList> countriesList = [
  CountriesList(
      name: "English_(US)",
      percentage: 34.0,
      flag:
          'https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/255px-Flag_of_the_United_States.svg.png'),
  CountriesList(
    name: "Indonesia",
    percentage: 10.0,
    flag: "https://cdn.britannica.com/48/1648-004-A33B72D8/Flag-Indonesia.jpg",
  ),
  CountriesList(
    name: "Afghanistan",
    percentage: 60.0,
    flag:
        "https://cdn.britannica.com/40/5340-004-B25ED5CF/Flag-Afghanistan.jpg",
  ),
  CountriesList(
    name: "Algeria",
    percentage: 40.0,
    flag: "https://cdn.britannica.com/34/3034-004-1A765B57/Flag-Algeria.jpg",
  ),
  CountriesList(
    name: "Malaysia",
    percentage: 22.0,
    flag:
        "https://a-z-animals.com/media/2023/01/shutterstock_1893096169-1024x576.jpg",
  ),
  CountriesList(
    name: "Zimbabwe",
    percentage: 39.0,
    flag: "https://flagcdn.com/w320/zw.png",
  ),
  CountriesList(
    name: "south korea",
    percentage: 12.0,
    flag: "https://flagcdn.com/w320/sk.png",
  ),
  CountriesList(
    name: "Guam",
    percentage: 60.0,
    flag: "https://flagcdn.com/w320/gu.png",
  ),
  CountriesList(
    name: "Netherland",
    percentage: 24.0,
    flag: "https://flagcdn.com/w320/nl.png",
  ),
  CountriesList(
    name: "Ecuador",
    percentage: 37.0,
    flag: "https://flagcdn.com/w320/ec.png",
  ),
  CountriesList(
    name: "Falkland",
    percentage: 50.0,
    flag: "https://flagcdn.com/w320/fk.png",
  ),
  CountriesList(
    name: "South_Africa",
    percentage: 16.0,
    flag: "https://flagcdn.com/w320/sa.png",
  ),
  CountriesList(
    name: "Minor_Outlying",
    percentage: 34.0,
    flag: "https://flagcdn.com/w320/um.png",
  ),
  CountriesList(
    name: "Central_African",
    percentage: 66.0,
    flag: "https://flagcdn.com/w320/cf.png",
  ),
  CountriesList(
    name: "pakistan",
    percentage: 34.0,
    flag: "https://flagcdn.com/w320/pk.png",
  ),
  CountriesList(
    percentage: 34.0,
    name: "United_Arab_Emirates",
    flag: "https://flagcdn.com/w320/ae.png",
  ),
  CountriesList(
    name: "Estonia",
    percentage: 34.0,
    flag: "https://flagcdn.com/w320/ee.png",
  ),
  CountriesList(
    name: "Bulgaria",
    percentage: 44.0,
    flag: "https://flagcdn.com/w320/bj.png",
  ),
  CountriesList(
    name: "Polynesia",
    percentage: 34.0,
    flag: "https://flagcdn.com/w320/pf.png",
  ),
  CountriesList(
    name: "Columbia",
    percentage: 79.0,
    flag: "https://flagcdn.com/w320/nc.png",
  ),
  CountriesList(
    name: "Sweden",
    percentage: 85.0,
    flag: "https://flagcdn.com/w320/se.png",
  ),
  CountriesList(
    name: "Peru",
    percentage: 64.0,
    flag: "https://flagcdn.com/w320/pe.png",
  ),
  CountriesList(
    name: "Tobago",
    percentage: 12.0,
    flag: "https://flagcdn.com/w320/tt.png",
  ),
  CountriesList(
    name: "Guatemala",
    percentage: 10.0,
    flag: "https://flagcdn.com/w320/gt.png",
  ),
  CountriesList(
    name: "Iraq",
    percentage: 31.0,
    flag: "https://flagcdn.com/w320/iq.png",
  ),
  CountriesList(
    name: "Greenland",
    percentage: 32.0,
    flag: "https://flagcdn.com/w320/gl.png",
  ),
  CountriesList(
    name: "Maldives",
    percentage: 34.0,
    flag: "https://flagcdn.com/w320/mv.png",
  ),
  CountriesList(
    name: "Macedonia",
    percentage: 94.0,
    flag: "https://flagcdn.com/w320/mk.png",
  ),
  CountriesList(
    name: "American_Samoa",
    percentage: 49.0,
    flag: "https://flagcdn.com/w320/as.png",
  ),
  CountriesList(
    name: "Mauritius",
    percentage: 45.0,
    flag: "https://flagcdn.com/w320/mu.png",
  ),
  CountriesList(
    name: "American",
    percentage: 90.0,
    flag: "https://flagcdn.com/w320/am.png",
  ),
  CountriesList(
    name: "Mali",
    percentage: 98.0,
    flag: "https://flagcdn.com/w320/ml.png",
  ),
  CountriesList(
    name: "Libya",
    percentage: 76.0,
    flag: "https://flagcdn.com/w320/ly.png",
  ),
  CountriesList(
    name: "Bermuda",
    percentage: 46.0,
    flag: "https://flagcdn.com/w320/bm.png",
  ),
  CountriesList(
    name: "Caicos_Islands",
    percentage: 36.0,
    flag: "https://flagcdn.com/w320/tc.png",
  ),
  CountriesList(
    name: "Andorra",
    percentage: 88.0,
    flag: "https://flagcdn.com/w320/ad.png",
  ),
  CountriesList(
    name: "Serbia",
    percentage: 67.0,
    flag: "https://flagcdn.com/w320/rs.png",
  ),
  CountriesList(
    name: "Mariana",
    percentage: 35.0,
    flag: "https://flagcdn.com/w320/mp.png",
  ),
  CountriesList(
    name: "jordan",
    flag: "https://flagcdn.com/w320/jo.png",
    percentage: 34.0,
  ),
];
String get(String countryName) {
  return countriesList
      .firstWhere((element) => element.name == countryName)
      .name
      .replaceAll('_', ' ');
}



 



























 

// https://flagcdn.com/w320/pa.png
// https://flagcdn.com/w320/va.png
// https://flagcdn.com/w320/sy.png
// https://flagcdn.com/w320/vu.png
// https://flagcdn.com/w320/hn.png
// https://flagcdn.com/w320/ki.png
// https://flagcdn.com/w320/cl.png
// https://flagcdn.com/w320/bf.png
// https://flagcdn.com/w320/kn.png
// https://flagcdn.com/w320/bl.png
// https://flagcdn.com/w320/mx.png
// https://flagcdn.com/w320/cn.png
// https://flagcdn.com/w320/tl.png
// https://flagcdn.com/w320/io.png
// https://flagcdn.com/w320/ss.png
// https://flagcdn.com/w320/sz.png
// https://flagcdn.com/w320/uz.png
// https://flagcdn.com/w320/id.png
// https://flagcdn.com/w320/py.png
// https://flagcdn.com/w320/mc.png
// https://flagcdn.com/w320/gd.png
// https://flagcdn.com/w320/hr.png
// https://flagcdn.com/w320/pl.png
// https://flagcdn.com/w320/ba.png
// https://flagcdn.com/w320/ca.png
// https://flagcdn.com/w320/pt.png
// https://flagcdn.com/w320/br.png
// https://flagcdn.com/w320/mr.png
// https://flagcdn.com/w320/il.png
// https://flagcdn.com/w320/cw.png
// https://flagcdn.com/w320/bn.png
// https://flagcdn.com/w320/ao.png
// https://flagcdn.com/w320/mt.png
// https://flagcdn.com/w320/by.png
// https://flagcdn.com/w320/tr.png
// https://flagcdn.com/w320/fi.png
// https://flagcdn.com/w320/gi.png
// https://flagcdn.com/w320/bt.png
// https://flagcdn.com/w320/es.png
// https://flagcdn.com/w320/ve.png
// https://flagcdn.com/w320/qa.png
// https://flagcdn.com/w320/cz.png
// https://flagcdn.com/w320/kw.png
// https://flagcdn.com/w320/me.png
// https://flagcdn.com/w320/bv.png
// https://flagcdn.com/w320/in.png
// https://flagcdn.com/w320/nz.png
// https://flagcdn.com/w320/jm.png
// https://flagcdn.com/w320/ky.png
// https://flagcdn.com/w320/sm.png
// https://flagcdn.com/w320/cg.png

// https://flagcdn.com/w320/fr.png
// https://flagcdn.com/w320/kz.png
// https://flagcdn.com/w320/bh.png
// https://flagcdn.com/w320/fj.png
// https://flagcdn.com/w320/is.png
// https://flagcdn.com/w320/mm.png
// https://flagcdn.com/w320/bd.png
// https://flagcdn.com/w320/ph.png
// https://flagcdn.com/w320/gq.png
// https://flagcdn.com/w320/ie.png
// https://flagcdn.com/w320/np.png
// https://flagcdn.com/w320/ye.png
// https://flagcdn.com/w320/kr.png
// https://flagcdn.com/w320/dk.png
// https://flagcdn.com/w320/om.png
// https://flagcdn.com/w320/vc.png
// https://flagcdn.com/w320/er.png
// https://flagcdn.com/w320/au.png
// https://flagcdn.com/w320/ir.png
// https://flagcdn.com/w320/sv.png
// https://flagcdn.com/w320/tz.png
// https://flagcdn.com/w320/gp.png
// https://flagcdn.com/w320/sb.png
// https://flagcdn.com/w320/ke.png
// https://flagcdn.com/w320/do.png
// https://flagcdn.com/w320/gr.png
// https://flagcdn.com/w320/gg.png
// https://flagcdn.com/w320/rw.png
// https://flagcdn.com/w320/pm.png
// https://flagcdn.com/w320/tv.png
// https://flagcdn.com/w320/tw.png
// https://flagcdn.com/w320/gy.png
// https://flagcdn.com/w320/sc.png
// https://flagcdn.com/w320/kp.png
// https://flagcdn.com/w320/bw.png
// https://flagcdn.com/w320/kh.png
// https://flagcdn.com/w320/bb.png
// https://flagcdn.com/w320/co.png
// https://flagcdn.com/w320/ua.png
// https://flagcdn.com/w320/ci.png
// https://flagcdn.com/w320/nr.png
// https://flagcdn.com/w320/na.png
// https://flagcdn.com/w320/td.png
// https://flagcdn.com/w320/to.png
// https://flagcdn.com/w320/ar.png
// https://flagcdn.com/w320/cx.png
// https://flagcdn.com/w320/ne.png
// https://flagcdn.com/w320/mh.png
// https://flagcdn.com/w320/cr.png
// https://flagcdn.com/w320/gh.png
// https://flagcdn.com/w320/at.png
// https://flagcdn.com/w320/sh.png
// https://flagcdn.com/w320/ps.png
// https://flagcdn.com/w320/cu.png
// https://flagcdn.com/w320/hu.png
// https://flagcdn.com/w320/fm.png
// https://flagcdn.com/w320/bz.png
// https://flagcdn.com/w320/bs.png
// https://flagcdn.com/w320/aw.png
// https://flagcdn.com/w320/st.png
// https://flagcdn.com/w320/ru.png
// https://flagcdn.com/w320/lu.png
// https://flagcdn.com/w320/fo.png
// https://flagcdn.com/w320/ni.png
// https://flagcdn.com/w320/tn.png
// https://flagcdn.com/w320/cd.png
// https://flagcdn.com/w320/sj.png
// https://flagcdn.com/w320/za.png
// https://flagcdn.com/w320/sl.png
// https://flagcdn.com/w320/ls.png
// https://flagcdn.com/w320/gs.png
// https://flagcdn.com/w320/it.png
// https://flagcdn.com/w320/dj.png
// https://flagcdn.com/w320/hm.png
// https://flagcdn.com/w320/lk.png
// https://flagcdn.com/w320/lc.png
// https://flagcdn.com/w320/ws.png
// https://flagcdn.com/w320/cc.png
// https://flagcdn.com/w320/pr.png
// https://flagcdn.com/w320/ga.png
// https://flagcdn.com/w320/tm.png
// https://flagcdn.com/w320/lv.png
// https://flagcdn.com/w320/sn.png
// https://flagcdn.com/w320/be.png
// https://flagcdn.com/w320/md.png
// https://flagcdn.com/w320/li.png
// https://flagcdn.com/w320/mw.png
// https://flagcdn.com/w320/lb.png
// https://flagcdn.com/w320/mn.png
// https://flagcdn.com/w320/no.png
// https://flagcdn.com/w320/vg.png
// https://flagcdn.com/w320/cm.png
// https://flagcdn.com/w320/th.png
// https://flagcdn.com/w320/ng.png
// https://flagcdn.com/w320/re.png
// https://flagcdn.com/w320/cv.png
// https://flagcdn.com/w320/je.png
// https://flagcdn.com/w320/dz.png
// https://flagcdn.com/w320/la.png
// https://flagcdn.com/w320/bq.png
// https://flagcdn.com/w320/az.png
// https://flagcdn.com/w320/sx.png
// https://flagcdn.com/w320/ma.png
// https://flagcdn.com/w320/ax.png
// https://flagcdn.com/w320/bg.png
// https://flagcdn.com/w320/bi.png
// https://flagcdn.com/w320/ug.png
// https://flagcdn.com/w320/xk.png
// https://flagcdn.com/w320/mz.png
// https://flagcdn.com/w320/ge.png
// https://flagcdn.com/w320/gb.png
// https://flagcdn.com/w320/wf.png
// https://flagcdn.com/w320/pn.png
// https://flagcdn.com/w320/ro.png
// https://flagcdn.com/w320/vn.png
// https://flagcdn.com/w320/tf.png
// https://flagcdn.com/w320/eh.png
// https://flagcdn.com/w320/jp.png
// https://flagcdn.com/w320/eg.png
// https://flagcdn.com/w320/lr.png
// https://flagcdn.com/w320/lt.png
// https://flagcdn.com/w320/ht.png
// https://flagcdn.com/w320/vi.png
// https://flagcdn.com/w320/pg.png
// https://flagcdn.com/w320/hk.png
// https://flagcdn.com/w320/kg.png
// https://flagcdn.com/w320/pw.png
// https://flagcdn.com/w320/mg.png
// https://flagcdn.com/w320/gm.png
// https://flagcdn.com/w320/tg.png
// https://flagcdn.com/w320/tk.png
// https://flagcdn.com/w320/si.png
// https://flagcdn.com/w320/sg.png
// https://flagcdn.com/w320/gf.png
// https://flagcdn.com/w320/us.png
// https://flagcdn.com/w320/ms.png
// https://flagcdn.com/w320/my.png
// https://flagcdn.com/w320/de.png
// https://flagcdn.com/w320/ag.png
// https://flagcdn.com/w320/mf.png
// https://flagcdn.com/w320/so.png
// https://flagcdn.com/w320/mo.png
// https://flagcdn.com/w320/al.png
// https://flagcdn.com/w320/yt.png
// https://flagcdn.com/w320/dm.png
// https://flagcdn.com/w320/zm.png
// https://flagcdn.com/w320/ai.png
// https://flagcdn.com/w320/ck.png
// https://flagcdn.com/w320/mq.png
// https://flagcdn.com/w320/gn.png
// https://flagcdn.com/w320/km.png
// https://flagcdn.com/w320/nu.png
// https://flagcdn.com/w320/ch.png
// https://flagcdn.com/w320/nf.png
// https://flagcdn.com/w320/im.png
// https://flagcdn.com/w320/sd.png
// https://flagcdn.com/w320/tj.png
// https://flagcdn.com/w320/uy.png
// https://flagcdn.com/w320/cy.png
// https://flagcdn.com/w320/gw.png