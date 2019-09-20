package ${package}.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import org.junit.Test;
import ${package}.model.${className}Model;
import ${package}.test.common.BaseTestCase;
import ${package}.service.${className}MicroService;
import com.camelot.openplatform.common.bean.Pager;

/**
 * @author ${author}
 * @date ${date} ${time}
 */
public class ${className}MicroServiceImplTest extends BaseTestCase{
	@Resource
	private ${className}MicroService ${classNameLower}MicroService;

	/**
	 * ${table.tableDesc}分页查询数据
	 */
	@Test
	public void queryPage(){
		List<String> queryFields = new ArrayList<String>();
		queryFields.add("id");
		${className}Model ${classNameLower}Model = new ${className}Model();
		List<${className}Model> list = ${classNameLower}MicroService.queryPage(${classNameLower}Model, new Pager(), null, queryFields);
		for(${className}Model model: list){
			System.out.println(model.getId());
		}
	}
	
	/**
	 * ${table.tableDesc}查询数据(不分页)
	 */
	@Test
	public void queryList(){
		List<String> queryFields = new ArrayList<String>();
		queryFields.add("id");
		${className}Model ${classNameLower}Model = new ${className}Model();
		List<${className}Model> list = ${classNameLower}MicroService.queryList(${classNameLower}Model, null, queryFields);
		for(${className}Model model: list){
			System.out.println(model.getId());
		}
	}
	
	/**
	 * ${table.tableDesc}查询总条数
	 */
	@Test
	public void queryCount(){
		${className}Model ${classNameLower}Model = new ${className}Model();
		Long count = ${classNameLower}MicroService.queryCount(${classNameLower}Model, null);
		System.out.println(count);
	}
	
	/**
	 * 根据id查询${table.tableDesc}
	 * Created on 2017年02月20日
	 * @author:${author}
	 */
	@Test
	public void queryById(){
		List<String> queryFields = new ArrayList<String>();
		queryFields.add("id");
		${className}Model model = ${classNameLower}MicroService.queryById(1l, queryFields);
		System.out.println(model);
	}
	
	/**
	 * ${table.tableDesc}新增
	 */
	@Test
	public void save(){
		${className}Model ${classNameLower}Model = new ${className}Model();
		//${classNameLower}Model.set
		${classNameLower}MicroService.save(${classNameLower}Model);
	}
	
	/**
	 * ${table.tableDesc}编辑
	 */
	@Test
	public void edit(){
		${className}Model ${classNameLower}Model = new ${className}Model();
		//${classNameLower}Model.set
		${classNameLower}MicroService.edit(${classNameLower}Model);
	}
	
	/**
	 * ${table.tableDesc}单个删除
	 */
	@Test
	public void deleteById(){
		System.out.println(${classNameLower}MicroService.deleteById(1l));
	}
	
	/**
	 * ${table.tableDesc}批量删除
	 */
	@Test
	public void deleteByIds(){
		List<Long> ids = new ArrayList<Long>();
		ids.add(1l);
		ids.add(2l);
		System.out.println(${classNameLower}MicroService.deleteByIds(ids));
	}
}