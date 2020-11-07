create or replace package dwh.pkg_lob2file
as

procedure prc_load_lob2file (p_file_lob in blob
                            ,p_file_path in varchar2
                            ,p_file_name in varchar2);

end pkg_lob2file;
/
create or replace package body dwh.pkg_lob2file
is

procedure prc_load_lob2file (p_file_lob in blob
                            ,p_file_path in varchar2
                            ,p_file_name in varchar2)
is
--v_blob blob := p_file_lob;
v_len pls_integer;


v_file utl_file.file_type;

v_buffer raw(32767);
v_amount pls_integer;
v_pos    pls_integer := 1;


begin

 v_amount := least(dbms_lob.getchunksize(p_file_lob), 32767);

 v_file := utl_file.fopen(location     => upper(p_file_path),
                          filename     => convert(p_file_name, 'CL8MSWIN1251', 'AL32UTF8'),
                          open_mode    => 'wb',
                          max_linesize => 32767);




 while v_pos <= dbms_lob.getlength(p_file_lob)
 loop
  dbms_lob.read(lob_loc => p_file_lob
               ,amount => v_amount
               ,offset => v_pos
               ,buffer => v_buffer);
  utl_file.put_raw(file => v_file
                  ,buffer => v_buffer
                  ,autoflush => true);

  v_pos := v_pos + v_amount;
 end loop;

 utl_file.fclose(v_file);
end prc_load_lob2file;

end pkg_lob2file;
/
