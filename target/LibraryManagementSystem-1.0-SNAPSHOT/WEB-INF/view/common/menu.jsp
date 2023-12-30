<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<div class="sidebar-wrapper" data-simplebar="init" >
    <div class="sidebar-header">
        <div>
<%--            <img src="assets/images/logo-icon.png" class="logo-icon" alt="logo icon">--%>
        </div>
        <div>
            <h4 class="logo-text">图书馆管理系统</h4>
        </div>
        <div class="toggle-icon ms-auto"><i class='bx bx-arrow-to-left'></i>
        </div>
    </div>
    <!--navigation-->
    <ul class="metismenu" id="menu" >

        <c:if test="${admin!=null}">

            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-home-circle'></i>
                    </div>
                    <div class="menu-title">用户管理</div>
                </a>
                <ul>
                    <li> <a href="userList.do"><i class="bx bx-right-arrow-alt"></i>用户列表</a>
                    </li>

                    <li> <a href="toAddUser.do"><i class="bx bx-right-arrow-alt"></i>添加用户</a>
                    </li>

                </ul>
            </li>

            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-home-circle'></i>
                    </div>
                    <div class="menu-title">图书管理</div>
                </a>
                <ul>
                    <li> <a href="bookList.do"><i class="bx bx-right-arrow-alt"></i>图书列表</a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-home-circle'></i>
                    </div>
                    <div class="menu-title">单位管理</div>
                </a>
                <ul>
                    <li> <a href="unitList.do"><i class="bx bx-right-arrow-alt"></i>单位列表</a>
                    </li>
                    <li> <a href="toAddUnit"><i class="bx bx-right-arrow-alt"></i>添加单位</a>
                    </li>
                </ul>
            </li>

        </c:if>

        <c:if test="${worker!=null}">

            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-home-circle'></i>
                    </div>
                    <div class="menu-title">图书管理</div>
                </a>
                <ul>
                    <li> <a href="bookList.do"><i class="bx bx-right-arrow-alt"></i>图书列表</a>
                    </li>
                    <li> <a href="toAddBook.do"><i class="bx bx-right-arrow-alt"></i>添加图书</a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-home-circle'></i>
                    </div>
                    <div class="menu-title">借阅管理</div>
                </a>
                <ul>
                    <li> <a href="borrowingList.do"><i class="bx bx-right-arrow-alt"></i>审核借阅</a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-home-circle'></i>
                    </div>
                    <div class="menu-title">流通管理</div>
                </a>
                <ul>
                    <li> <a href="circulateList.do"><i class="bx bx-right-arrow-alt"></i>流通申请</a>
                    </li>

                    <li> <a href="circulationList.do"><i class="bx bx-right-arrow-alt"></i>流通记录</a>
                    </li>

                </ul>
            </li>

            <li>
                <a href="toStatistics.do" aria-expanded="true">
                    <div class="parent-icon"><i class="bx bx-home-circle"></i>
                    </div>
                    <div class="menu-title">统计分析</div>
                </a>
            </li>

        </c:if>

        <c:if test="${reader!=null}">

            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-home-circle'></i>
                    </div>
                    <div class="menu-title">个人中心</div>
                </a>
                <ul>
                    <li> <a href="toUserDetail.do?userid=${reader.userid}"><i class="bx bx-right-arrow-alt"></i>个人信息</a>
                    </li>
                    <li> <a href="toUpdateUser.do?userid=${reader.userid}"><i class="bx bx-right-arrow-alt"></i>编辑信息</a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-home-circle'></i>
                    </div>
                    <div class="menu-title">图书查询</div>
                </a>
                <ul>
                    <li> <a href="bookList.do"><i class="bx bx-right-arrow-alt"></i>查询列表</a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-home-circle'></i>
                    </div>
                    <div class="menu-title">图书借阅</div>
                </a>
                <ul>
                    <li> <a href="borrowList.do"><i class="bx bx-right-arrow-alt"></i>借阅申请</a>
                    </li>
                    <li> <a href="borrowingList.do"><i class="bx bx-right-arrow-alt"></i>借阅记录</a>
                    </li>
                </ul>
            </li>

        </c:if>

    </ul>
    <!--end navigation-->
</div>
<footer class="page-footer">
<%--    <p class="mb-0">Copyright©</p>--%>
</footer>
