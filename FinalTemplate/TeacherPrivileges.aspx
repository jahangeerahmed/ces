﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="TeacherPrivileges.aspx.cs" Inherits="FinalTemplate.TeacherPrivileges" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
    <link href="assets/css/toggleSwitch.css" rel="stylesheet" />
    <script src="assets/js/jquery-2.2.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            
            $('#tablebody').empty();
            $('.heading-table').css('background-color', '#c50d0d');
            RemoveBackButton();
            $('#<%=btnGetPrivileges.ClientID%>').click(function (e) {
                e.preventDefault();
                $('#tablebody').empty();
                GetTeacherPrivileges();
            });
        });
        function RemoveBackButton() {
            $('#back-top').remove();
        }

        function columnvalue(controlid) {
            if ($(controlid).css('display') == 'block') {
                return true;
            } else {
                return false;
            }
        }
        function UpdatePrivilege(column,value) {
            var teacherid = $('#<%=txtTeacherIDToPopulatePrivileges.ClientID%>').val();
            $.ajax({
                url: 'source/WebServices/GetAllTeachers.asmx/UpdatePrivileges',
                data: { _columnName:column, _value: value, _teacherid:teacherid},
                dataType: 'json',
                dataContent: 'application/json; charset=utf-8',
                success: function (data) {
                    
                },
                error: function(data) {
                    alert('Error' + data);
                }
            });
        }

        function GetTeacherPrivileges() {
            var teacherid = $('#<%=txtTeacherIDToPopulatePrivileges.ClientID%>').val();
            $.ajax({
                url: 'source/WebServices/GetAllTeachers.asmx/GetPrivileges',
                method: 'post',
                data: { _teacherID: teacherid},
                datatype: 'json',
                success: function (data) {
                    var obj = JSON.stringify(data);
                    var arrayjson = $.parseJSON(obj);
                    var actualarray = $.parseJSON(arrayjson);
                    $.each(actualarray, function (i, v) {
                        $('#tablebody').append('<tr class="table-row"> <td class="col-3"><span>Events</span></td><td class="col-2"><a href="#">is this teacher eligible to making events?</a></td><td class="col-3"><label class="switch centerbuttion "><input id="check_event" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="No"></span><span class="switch-handle"></span></label></td></tr><tr class="table-row">  <td class="col-3"><span>Attendance</span></td><td class="col-2"><a href="#">Do you want this teacher can mark attendance?</a></td><td class="col-3"><label class="switch centerbuttion "><input id="check_attendance" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="NO"></span><span class="switch-handle"></span></label></td></tr><tr class="table-row"><td class="col-3"><span>Homework</span></td><td class="col-2"><a href="#">Teacher will be able to upload homework with their respective classes.</a></td><td class="col-3"><label class="switch centerbuttion "><input id="check_homework" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="NO"></span><span class="switch-handle"></span></label></td></tr><tr class="table-row"><td class="col-3"><span>Reports</span></td><td class="col-2"><a href="#">Do you want this teacher to generate reports?</a></td><td class="col-3"><label class="switch centerbuttion "><input id="check_reports" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="NO"></span><span class="switch-handle"></span></label></td></tr><tr class="table-row"><td class="col-3"><span>Timetable</span></td><td class="col-2"><a href="#">Can this teacher make time table(s)?</a></td><td class="col-3"><label class="switch centerbuttion "><input id="check_timetable" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="NO"></span><span class="switch-handle"></span></label></td></tr><tr class="table-row"><td class="col-3"><span>Datesheet</span></td><td class="col-2"><a href="#">Can this teacher make Date Sheet(s)?</a></td><td class="col-3"><label class="switch centerbuttion "><input id="check_datesheets" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="NO"></span><span class="switch-handle"></span></label></td></tr>');
                        var event = v.Event;
                        var attendance = v.Attendance;
                        var homework = v.Homework;
                        var reports = v.Reports;
                        var timetable = v.TimeTable;
                        var datesheet = v.DateSheet;
                        if (event == 1) {
                            $('#check_event').trigger('click');
                        }
                        if (attendance == 1) {
                            $('#check_attendence').trigger('click');
                        }
                        if (homework == 1) {
                            $('#check_homework').trigger('click');
                        }
                        if (reports == 1) {
                            $('#check_reports').trigger('click');
                        }
                        if (timetable == 1) {
                            $('#check_timetable').trigger('click');
                        }
                        if (datesheet == 1) {
                            $('#check_datesheets').trigger('click');
                        }
                    });
                },
                error: function (error) {
                    alert("Error: " + error);
                }
            });
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
    <div class="section section-padding top-courses">
        <div class="container">
            <div class="group-title-index">
                <h2 class="center-title">Insert Teacher ID to get his/her privileges status</h2>
                <div class="bottom-title"><i class="bottom-icon icon-icon-04"></i></div>
                <p>By clicking on Yes/No button privilege will be assign and unassign respectivily. Changes will be reflected immediately after you press the Yes/NO toggle button.</p>
                <div class="container teacher-course-wrapper">
                    <div class="inner-container">
                        <div class="table-header">
                            <table class="edu-table-responsive">
                                <thead>
                                    <tr class="heading-table">
                                        <th class="col-3">Teacher ID</th>
                                        
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Teacher ID</span></td>
                                        <td class="col-2"><asp:TextBox CssClass="fullWidth" ID="txtTeacherIDToPopulatePrivileges" runat="server"></asp:TextBox></td>
                                        <td class="col-3">
                                            <asp:Button Text="Get Privileges" runat="server" ID="btnGetPrivileges" />
                                        </td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                     <div class="inner-container">
                        <div class="table-header">
                            <table class="edu-table-responsive">
                                <thead>
                                    <tr class="heading-table">
                                        <th class="col-3">Privilege</th>
                                        <th class="col-2">Privilege Description</th>
                                        <th class="col-3">Privilege Status</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="table-body">
                            <table class="edu-table-responsive table-hover">
                                <tbody id="tablebody">
                                    <tr class="table-row">
                                        <td class="col-3"><span>Events</span></td>
                                        <td class="col-2"><a href="#">is this teacher eligible to making events?</a></td>
                                        <td class="col-3">
                                            <label class="switch centerbuttion ">
                                                <input id="check_event" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="No"></span><span class="switch-handle"></span></label></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Attendance</span></td>
                                        <td class="col-2"><a href="#">Do you want this teacher can mark attendance?</a></td>
                                        <td class="col-3">
                                            <label class="switch centerbuttion ">
                                                <input id="check_attendence" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="NO"></span><span class="switch-handle"></span></label></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Homework</span></td>
                                        <td class="col-2"><a href="#">Teacher will be able to upload homework with their respective classes.</a></td>
                                        <td class="col-3">
                                            <label class="switch centerbuttion ">
                                                <input id="check_homework" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="NO"></span><span class="switch-handle"></span></label></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Reports</span></td>
                                        <td class="col-2"><a href="#">Do you want this teacher to generate reports?</a></td>
                                        <td class="col-3">
                                            <label class="switch centerbuttion ">
                                                <input id="check_reports" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="NO"></span><span class="switch-handle"></span></label></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Timetable</span></td>
                                        <td class="col-2"><a href="#">Can this teacher make time table(s)?</a></td>
                                        <td class="col-3">
                                            <label class="switch centerbuttion ">
                                                <input id="check_timetable" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="NO"></span><span class="switch-handle"></span></label></td>
                                    </tr>
                                    <tr class="table-row">
                                        <td class="col-3"><span>Datesheet</span></td>
                                        <td class="col-2"><a href="#">Can this teacher make Date Sheet(s)?</a></td>
                                        <td class="col-3">
                                            <label class="switch centerbuttion ">
                                                <input id="check_datesheets" class="switch-input" type="checkbox" /><span class="switch-label" data-on="Yes" data-off="NO"></span><span class="switch-handle"></span></label></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
