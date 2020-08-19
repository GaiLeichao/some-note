asd0 as ( 
        select t.id,replace(t.attach,chr(35),',') attach 
        from audit_send_detail t where t.serialno = '200943145' 
      ),
     asd1 as (
       select distinct t.id,regexp_substr(t.attach,'[^,]+',1,level) attach 
       from asd0 t 
       connect by level <= length(t.attach)-length(replace(t.attach,',',''))+1
    ),
    att2 as (
       select asd1.id, replace(wmsys.wm_concat(att.attach_filename),',',chr(10)) attach,
        to_char(wmsys.wm_concat(att.id))||chr(35)||','||chr(35)||to_char(wmsys.wm_concat(att.attach_filename))||chr(35)||','||chr(35)||to_char(wmsys.wm_concat(att.attach_title)) as attach_detail  
        from asd1,attach att where asd1.attach = att.id group by asd1.id
    )
	
	
	
	NVL(E1, E2)的功能为：如果E1为NULL，则函数返回E2，否则返回E1本身
	NVL2(E1, E2, E3)的功能为：如果E1为NULL，则函数返回E3，若E1不为null，则返回E2。
	
	decode(条件，值1，返回值1，值2，返回值2，...值n,返回值n，缺省值) 
	
	当x>0，sign(x)=1;当x=0，sign(x)=0; 当x<0， sign(x)=-1；
	
	mod() : 取余
　 1.取整bai(大)
　　select ceil(-1.001) value from dual
　　2.取整（小）du
　　select floor(-1.001) value from dual
　　3.取整（截取）
　　select trunc(-1.002) value from dual
	4.取整(舍入)
	select round(-1.001) value from dual
	
	
	SELECT trunc(get_worktime( '2020-01-19 15:07:09','2020-06-15 13:46:58', NULL, NULL )/24) || '天' ||
trunc(mod(get_worktime( '2020-01-19 15:07:09','2020-06-15 13:46:58', NULL, NULL ),24)) || '小时' ||
trunc((mod(get_worktime( '2020-01-19 15:07:09','2020-06-15 13:46:58', NULL, NULL ),24)-trunc(mod(get_worktime( '2020-01-19 15:07:09','2020-06-15 13:46:58', NULL, NULL ),24)))*60) || '分钟' ||
((mod(get_worktime( '2020-01-19 15:07:09','2020-06-15 13:46:58', NULL, NULL ),24)-trunc(mod(get_worktime( '2020-01-19 15:07:09','2020-06-15 13:46:58', NULL, NULL ),24)))*60-trunc((mod(get_worktime( '2020-01-19 15:07:09','2020-06-15 13:46:58', NULL, NULL ),24)-trunc(mod(get_worktime( '2020-01-19 15:07:09','2020-06-15 13:46:58', NULL, NULL ),24)))*60))*60 || '毫秒' 
from dual


---重复数据分组排序 可用于查询最新一条数据
row_number() OVER(PARTITION BY t.wf_num ORDER BY t.submit_time desc) as row_flg 

ex:
select  t.wf_num,t.submit_time,t.wf_serial_no,
    row_number() OVER(PARTITION BY t.wf_num ORDER BY t.submit_time desc) as row_flg  
	from DWFFORMF8130102 t 
	
	截取字符串
	SELECT substr('黄海潮,陈瑾,王蕾',4)   from dual;
			SELECT substr('黄海潮,陈瑾,王蕾',4,2)   from dual;
			SELECT instr('黄海潮,陈瑾,王蕾',',')   from dual;