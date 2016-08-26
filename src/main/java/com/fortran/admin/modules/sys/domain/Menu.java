package com.fortran.admin.modules.sys.domain;

import com.fortran.admin.modules.core.common.Domain;
import com.fortran.admin.modules.sys.enumeration.ShowStatus;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

/**
 * @author: lin
 * @Date: 2016-08-02 Time: 9:22
 * @description: <p>系统菜单</p>
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Menu extends Domain {

    /**
     * 主键
     */
    private Long menuId;

    /**
     * 菜单名称
     */
    private String menuName;

    /**
     *图标
     */
    private String icon;
    /**
     *链接
     */
    private String href;
    /**
     *是否显示 0：显示，1：隐藏
     */
    private String isShow;
    /**
     *父菜单ID
     */
    private Long parentId;
    /**
     *权限标识
     */
    private String permission;
    /**
     *排序
     */
    private Integer sort;
    /**
     *目标框架（默认mainFrame）
     */
    private String target;
    /**
     *备注
     */
    private  String remarks;

    /**
     * 子菜单
     */
    private List<Menu> childMenu;

    public String getIsShow(){
        return ShowStatus.getLabelByValue(this.isShow);
    }


}
