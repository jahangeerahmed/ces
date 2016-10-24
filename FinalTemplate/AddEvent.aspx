﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddEvent.aspx.cs" Inherits="FinalTemplate.AddEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="AdminHeadPlaceHolder" runat="server">
	
    <link href="assets/AddEventDatePicker/dist/bootstrap-clockpicker.css" rel="stylesheet" />
    <script src="assets/AddEventDatePicker/dist/bootstrap-clockpicker.js"></script>
    <link href="assets/AddEventDatePicker/dist/bootstrap-clockpicker.min.css" rel="stylesheet" />
    <script src="assets/AddEventDatePicker/dist/bootstrap-clockpicker.min.js"></script>
    <link href="assets/AddEventDatePicker/dist/jquery-clockpicker.css" rel="stylesheet" />
    <script src="assets/AddEventDatePicker/dist/jquery-clockpicker.js"></script>
    <link href="assets/AddEventDatePicker/dist/jquery-clockpicker.min.css" rel="stylesheet" />
    <script src="assets/AddEventDatePicker/dist/jquery-clockpicker.min.js"></script>
    
    <link href="assets/AddEventDatePicker/src/clockpicker.css" rel="stylesheet" />
    <script src="assets/AddEventDatePicker/src/clockpicker.js"></script>
    <link href="assets/AddEventDatePicker/src/standalone.css" rel="stylesheet" />
	<!----------------------------------------------------------->
	 <script src="assets/js/jquery-2.2.3.js"></script>
	<script type="text/javascript">
	    $(document).ready(function() {
	        $('td').css('padding', '10px');
	        AllControlsWidth();
	        heading();
	        //CallDatePicker('#<%=txtStartDate.ClientID%>');
		    

	    });

	    function CallDatePicker(controlid) {
	        $(this).on('click', function () {
	            alert(controlid);
	            $(controlid).bootstrapMaterialDatePicker({ weekStart: 0, time: false });

	        });
			
	    }

	    function AllControlsWidth() {
	        SetControlWith('#<%=txtEventTitle.ClientID%>');
	        SetControlWith('#<%=txtEventDescription.ClientID%>');
	        SetControlWith('#<%=txtEventPlace.ClientID%>');
	        SetControlWith('#<%=ddlEventType.ClientID%>');
	        SetControlWith('#<%=txtStartTime.ClientID%>');
	        SetControlWith('#<%=txtEndTime.ClientID%>');
	        SetControlWith('#<%=txtStartDate.ClientID%>');
	        SetControlWith('#<%=txtEndDate.ClientID%>');
	        SetControlWith('#<%=txtTags.ClientID%>');
	        SetControlWith('#<%=btnAddEvent.ClientID%>');
	    }
	    function heading() {
	        var color = "rgba(102, 68, 238, 0.91)";
	        $('.heading-table').css('background-color',color );
	    }

	    function SetControlWith(controlid) {
	        $(controlid).css('width','100%');
	    }
	</script>	
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminContentPlaceHolder" runat="server">
	<div class="section section-padding top-courses">
		<div class="container">
			<div class="group-title-index">
				<h2 class="center-title">Add Event</h2>
				<div class="bottom-title"><i class="bottom-icon icon-icon-04"></i></div>
				<p>What a school can be considered without social interactions and conversations between students, teachers, parents and the school administration. Create an event and let everybody come close and shere some beautiful moments together.</p>
				<div class="container teacher-course-wrapper">
					 <div class="inner-container">
						<div class="table-header">
							<table class="edu-table-responsive">
								<thead>
								   <tr class="heading-table">
										<th class="col-3">Feel free to fillup the form</th>
								   </tr>
								</thead>
							</table>
						</div>
						<div class="table-body">
							<table class="edu-table-responsive table-hover">
								<tbody>
									<tr class="table-row">
										<td class="col-3"><span>Event Title</span></td>
										<td class="col-9"><asp:TextBox runat="server" ID="txtEventTitle" CssClass="fullWidth"></asp:TextBox></td>
										 <td class="col-3"></td>
									</tr>
									<tr class="table-row">
										<td class="col-3"><span>Event Description</span></td>
										<td class="col-9"><asp:TextBox runat="server" TextMode="MultiLine" ID="txtEventDescription" Rows="7" CssClass="fullWidth"></asp:TextBox></td>
										 <td class="col-3"></td>
									</tr>
									<tr class="table-row">
										<td class="col-3"><span>Event Place</span></td>
										<td class="col-9"><asp:TextBox runat="server" ID="txtEventPlace" CssClass="fullWidth"></asp:TextBox></td>
										 <td class="col-3"></td>
									</tr>
                                    <tr class="table-row">
										<td class="col-3"><span>Picture</span></td>
										<td class="col-9"><asp:FileUpload runat="server" ID="fuPicture" CssClass="fullWidth"/></td>
										 <td class="col-3"></td>
									</tr>
									<tr class="table-row">
										<td class="col-3"><span>Event Type</span></td>
										<td class="col-9"><asp:DropDownList runat="server" ID="ddlEventType" CssClass="fullWidth"></asp:DropDownList></td>
										 <td class="col-3"></td>
									</tr>
									<tr class="table-row">
										<td class="col-3"><span>Start Time</span></td>
										<td class="col-9">
                                            <div id="starttime" class="input-group clockpicker" data-placement="top" data-align="top" data-autoclose="true">
                                                 <asp:TextBox runat="server" CssClass="form-control" ID="txtStartTime" value="00:00"></asp:TextBox>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-time"></span>
                                                </span>
                                            </div>
										</td>
										 <td class="col-3"></td>
									</tr>
									<tr class="table-row">
										<td class="col-3"><span>End Time</span></td>
										<td class="col-9">
										     <div id="endtime" class="input-group clockpicker" data-placement="top" data-align="top" data-autoclose="true">
                                                 <asp:TextBox runat="server" CssClass="form-control" ID="txtEndTime" value="00:00"></asp:TextBox>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-time"></span>
                                                </span>
                                            </div>
										</td>
										 <td class="col-3"></td>
									</tr>
									<tr class="table-row">
										<td class="col-3"><span>Start Date</span></td>
										<td class="col-9"><asp:TextBox type="date" runat="server" ID="txtStartDate" CssClass="fullWidth"></asp:TextBox></td>
										 <td class="col-3"></td>
									</tr>
									<tr class="table-row">
										<td class="col-3"><span>End Date</span></td>
										<td class="col-9"><asp:TextBox type="date" runat="server" ID="txtEndDate" CssClass="fullWidth"></asp:TextBox></td>
										 <td class="col-3"></td>
									</tr>
									<tr class="table-row">
										<td class="col-3"><span>Tags</span></td>
										<td class="col-9">
										    <asp:TextBox runat="server" ID="txtTags" CssClass="fullWidth"></asp:TextBox>
                                            Separate each tag with comma " , " and add as upto 5 tags. This will help you to search this event easily.
										</td>
										 <td class="col-3"></td>
									</tr>
									 <tr class="table-row">
										<td class="col-3"></td>
										<td class="col-2"><asp:Button runat="server" ID="btnAddEvent" Text="Add Event" OnClick="btnAddEvent_Click"/></td>
										 <td class="col-3"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
    
<script type="text/javascript" src="assets/AddEventDatePicker/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/AddEventDatePicker/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/AddEventDatePicker/dist/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript">
    $('.clockpicker').clockpicker();
    $('.clockpicker').clockpicker()
        .find('input').change(function () {
            console.log(this.value);
        });
    var input = $('#single-input').clockpicker({
        placement: 'bottom',
        align: 'left',
        autoclose: true,
        'default': 'now'
    });

    $('.clockpicker-with-callbacks').clockpicker({
            donetext: 'Done',
            init: function () {
                console.log("colorpicker initiated");
            },
            beforeShow: function () {
                console.log("before show");
            },
            afterShow: function () {
                console.log("after show");
            },
            beforeHide: function () {
                console.log("before hide");
            },
            afterHide: function () {
                console.log("after hide");
            },
            beforeHourSelect: function () {
                console.log("before hour selected");
            },
            afterHourSelect: function () {
                console.log("after hour selected");
            },
            beforeDone: function () {
                console.log("before done");
            },
            afterDone: function () {
                console.log("after done");
            }
        })
        .find('input').change(function () {
            console.log(this.value);
        });

    // Manually toggle to the minutes view
    $('#check-minutes').click(function (e) {
        // Have to stop propagation here
        e.stopPropagation();
        input.clockpicker('show')
            .clockpicker('toggleView', 'minutes');
    });
    if (/mobile/i.test(navigator.userAgent)) {
        $('input').prop('readOnly', true);
    }
</script>
<script type="text/javascript" src="assets/AddEventDatePicker/assets/js/highlight.min.js"></script>
<script type="text/javascript">
    hljs.configure({ tabReplace: '    ' });
    hljs.initHighlightingOnLoad();
</script>
</asp:Content>