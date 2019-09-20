package ${package}.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author ${author}
 * @date ${date} ${time}
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ${className}Model  implements Serializable {
	private static final long serialVersionUID = 1L;

<#list table.columns as column>
	/**
     * ${column.label}
     */
	private ${column.type} ${column.name};
</#list>

<#list table.columns as column>
	public ${column.type} get${column.nameUpper}(){
		return ${column.name};
	}

	public void set${column.nameUpper}(${column.type} ${column.name}){
		this.${column.name} = ${column.name};
	}
</#list>
}
