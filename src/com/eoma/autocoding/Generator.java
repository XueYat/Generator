package com.eoma.autocoding;

import com.eoma.autocoding.common.Column;
import com.eoma.autocoding.common.Table;
import com.eoma.autocoding.utils.CamelCaseUtils;
import com.eoma.autocoding.utils.FileHelper;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.apache.log4j.Logger;

import java.io.*;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author YatXue
 * @date 2019/9/19 23:01
 */
public class Generator {
    private Logger logger = Logger.getLogger(this.getClass());
    private Properties properties;

    private Generator() throws Exception {
        properties = new Properties();
        String fileDir = this.getClass().getClassLoader().getResource("generator.xml").getFile();
        properties.loadFromXML(new FileInputStream(fileDir));
    }

    private Table parseTable(String tableName) throws Exception {
        String driverName = properties.getProperty("jdbc.driver");
        String userName = properties.getProperty("jdbc.username");
        String userPwd = properties.getProperty("jdbc.password");
        String dbUrl = properties.getProperty("jdbc.url");

        String catalog = properties.getProperty("jdbc.catalog");
        String schema = properties.getProperty("jdbc.schema");
        schema = schema == null ? "%" : schema;
        String column = "%";

        logger.debug("driver>>" + driverName);
        logger.debug("url>>" + dbUrl);
        logger.debug("name>>" + userName);
        logger.debug("password>>" + userPwd);
        logger.debug("catalog>>" + catalog);
        logger.debug("schema>>" + schema);

        Class.forName(driverName);
        Connection conn = java.sql.DriverManager.getConnection(dbUrl, userName, userPwd);
        DatabaseMetaData dmd = conn.getMetaData();

        ResultSet rs = dmd.getColumns(catalog, schema, tableName, column);
        List<Column> columns = new ArrayList<Column>();
        while (rs.next()) {
            Column c = new Column();

            c.setLabel(rs.getString("REMARKS"));

            String name = rs.getString("COLUMN_NAME");
            c.setName(CamelCaseUtils.toCamelCase(name));
            c.setDbName(name);

            String dbType = rs.getString("TYPE_NAME");

            int columnSize = rs.getInt("COLUMN_SIZE");
            if ("TINYINT".equals(dbType) && columnSize > 1) {
                c.setType("Integer");
            } else if ("TINYINT".equals(dbType) && columnSize == 1) {
                c.setType("Boolean");
            } else {
                String type = properties.getProperty(dbType);
                c.setType(type == null ? "String" : type);
            }
            c.setDbType(dbType);

            c.setLength(rs.getInt("COLUMN_SIZE"));
            c.setDecimalDigits(rs.getInt("DECIMAL_DIGITS"));
            c.setNullable(rs.getBoolean("NULLABLE"));
            columns.add(c);
        }

        List<Column> pkColumns = new ArrayList<Column>();
        ResultSet pkrs = dmd.getPrimaryKeys(catalog, schema, tableName);
        while (pkrs.next()) {
            Column c = new Column();
            String name = pkrs.getString("COLUMN_NAME");
            c.setName(CamelCaseUtils.toCamelCase(name));
            c.setDbName(name);
            pkColumns.add(c);
        }

        conn.close();

        Table t = new Table();
        String prefiex = properties.getProperty("tableRemovePrefixes");
        String name = tableName;
        if (prefiex != null && !"".equals(prefiex)) {
            name = tableName.split(prefiex)[0];
        }
        t.setName(CamelCaseUtils.toCamelCase(name));
        t.setDbName(tableName);
        t.setColumns(columns);
        t.setPkColumns(pkColumns);
        return t;
    }

    /**
     * 生成映射文件和实体类
     * @param tableName       要声称映射文件和实体类的表名称
     * @param tableDescAndCat 表描述
     * @throws Exception e
     */
    private void gen(String tableName, String tableDescAndCat) throws Exception {
        Configuration cfg = new Configuration(Configuration.VERSION_2_3_21);

        String outRoot = properties.getProperty("outRoot");
        String basepackage = properties.getProperty("basepackage");
        //获取当前日期
        SimpleDateFormat smDate = new SimpleDateFormat("yyyy/MM/dd");
        SimpleDateFormat smTime = new SimpleDateFormat("HH:mm");
        SimpleDateFormat smYear = new SimpleDateFormat("yyyy年");

        //将首字母转为大写
        StringBuffer buffer = new StringBuffer();
        String namePart1 = "bigint".substring(0, 1).toUpperCase();
        String namePart2 = "bigint".substring(1);
        buffer.append(namePart1).append(namePart2);

        System.out.println(buffer);

        Map<String, Object> root = new HashMap<String, Object>(16);
        Table t = this.parseTable(tableName);
        t.setTableDesc(tableDescAndCat.split("_")[0]);
        root.put("table", t);
        root.put("className", t.getNameUpper());
        root.put("classNameLower", t.getName());
        root.put("primaryKey", "id");
        root.put("modelId", "bigint");
        root.put("modelIdFirstUpper", buffer);
        root.put("package", basepackage);
        root.put("date", smDate.format(new Date()));
        root.put("time", smTime.format(new Date()));
        root.put("year", smYear.format(new Date()));
        root.put("author", "YatXue");
        root.put("email", "XueYat@gmail.com");

        String templateDir = this.getClass().getClassLoader().getResource("templates").getPath();
        File tdf = new File(templateDir);
        List<File> files = FileHelper.findAllFile(tdf);
        for (File f : files) {
            String parentDir = "";
            if (f.getParentFile().compareTo(tdf) != 0) {
                parentDir = f.getParent().split("templates")[1];
            }
            cfg.setClassForTemplateLoading(this.getClass(), "/templates" + parentDir);
            Template template = cfg.getTemplate(f.getName());
            template.setEncoding("UTF-8");
            String parentFileDir = FileHelper.genFileDir(parentDir, root);
            parentFileDir = parentFileDir.replace(".", "/");
            String file = FileHelper.genFileDir(f.getName(), root).replace(".ftl", ".java");
            System.out.println(file);
            File newFile = FileHelper.makeFile(outRoot + parentFileDir + "/" + file);
            Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(newFile), "UTF-8"));
            template.process(root, out);
            logger.debug("已生成文件：" + outRoot + parentFileDir + "/" + file);
        }
    }

    public static void main(String[] args) throws Exception {
        Generator g = new Generator();
        Map<String, String> map = new HashMap<String, String>(16);
        //修改要生成的表名
        map.put("table", "table");
        for (Map.Entry<String, String> e : map.entrySet()) {
            //acc_id 是数据库主键字段
            //accId 是主键对应的model字段 这在根据id查询 删除 修改时用到
            g.gen(e.getKey(), e.getValue());
        }
        System.out.println("模版文件生成完毕……");
    }
}
