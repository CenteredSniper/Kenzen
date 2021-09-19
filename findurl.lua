printconsole("\\ Downloading Audio")
local domains = [[.ac.ad.ae.aero.af.ag.ai.al.am.an.ao.aq.ar.arpa.as.asia.at.au
   .aw.ax.az.ba.bb.bd.be.bf.bg.bh.bi.biz.bj.bm.bn.bo.br.bs.bt.bv.bw.by.bz.ca
   .cat.cc.cd.cf.cg.ch.ci.ck.cl.cm.cn.co.com.coop.cr.cs.cu.cv.cx.cy.cz.dd.de
   .dj.dk.dm.do.dz.ec.edu.ee.eg.eh.er.es.et.eu.fi.firm.fj.fk.fm.fo.fr.fx.ga
   .gb.gd.ge.gf.gh.gi.gl.gm.gn.gov.gp.gq.gr.gs.gt.gu.gw.gy.hk.hm.hn.hr.ht.hu
   .id.ie.il.im.in.info.int.io.iq.ir.is.it.je.jm.jo.jobs.jp.ke.kg.kh.ki.km.kn
   .kp.kr.kw.ky.kz.la.lb.lc.li.lk.lr.ls.lt.lu.lv.ly.ma.mc.md.me.mg.mh.mil.mk
   .ml.mm.mn.mo.mobi.mp.mq.mr.ms.mt.mu.museum.mv.mw.mx.my.mz.na.name.nato.nc
   .ne.net.nf.ng.ni.nl.no.nom.np.nr.nt.nu.nz.om.org.pa.pe.pf.pg.ph.pk.pl.pm
   .pn.post.pr.pro.ps.pt.pw.py.qa.re.ro.ru.rw.sa.sb.sc.sd.se.sg.sh.si.sj.sk
   .sl.sm.sn.so.sr.ss.st.store.su.sv.sy.sz.tc.td.tel.tf.tg.th.tj.tk.tl.tm.tn
   .to.tp.tr.travel.tt.tv.tw.tz.ua.ug.uk.um.us.uy.va.vc.ve.vg.vi.vn.vu.web.wf
   .ws.xxx.ye.yt.yu.za.zm.zr.zw]]
local a = _G.URL:split("v=")
local text = game:HttpGet("https://api.tubemp3.biz/audio/" .. a[#a])
printconsole("\\ Grabbing Data")
repeat wait() until text
printconsole("\\ Grabbed Data")
	local tlds = {}
	for tld in domains:gmatch'%w+' do
		tlds[tld] = true
	end
	local function max4(a,b,c,d) return math.max(a+0, b+0, c+0, d+0) end
	local protocols = {[''] = 0, ['http://'] = 0, ['https://'] = 0, ['ftp://'] = 0}
	local finished = {}
printconsole("\\ Looking Through URLS")
	for pos_start, url, prot, subd, tld, colon, port, slash, path in
		text:gmatch'()(([%w_.~!*:@&+$/?%%#-]-)(%w[-.%w]*%.)(%w+)(:?)(%d*)(/?)([%w_.~!*:@&+$/?%%#=-]*))'
	do
		if protocols[prot:lower()] == (1 - #slash) * #path and not subd:find'%W%W'
			and (colon == '' or port ~= '' and port + 0 < 65536)
			and (tlds[tld:lower()] or tld:find'^%d+$' and subd:find'^%d+%.%d+%.%d+%.$'
				and max4(tld, subd:match'^(%d+)%.(%d+)%.(%d+)%.$') < 256)
		then
			finished[pos_start] = true
			--print(pos_start, url)
			if string.match(url, "download") then
			printconsole("\\ Found Download URL")
				return url
			end
		end
	end
