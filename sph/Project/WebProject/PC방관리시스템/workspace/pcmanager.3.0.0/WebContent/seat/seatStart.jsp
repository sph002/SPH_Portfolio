<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="work.model.dao.*"%>
<%@ page import="work.model.dto.*"%>
<%@ page import="work.controller.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>좌석배정시스템</title>
<%
		SeatDao dao = new SeatDao();
		ArrayList<Seat> list = dao.selectList();
%>

	<script type="text/javascript">
	function payCount1(){
		document.payForm.totalCost.value=1000;
		document.payForm.remainCost.value=1000;
	}
	function payCount2(){
		document.payForm.totalCost.value=2000;
		document.payForm.remainCost.value=2000;
	}
	function payCount3(){
		document.payForm.totalCost.value=3000;
		document.payForm.remainCost.value=3000;
	}
	function payCount5(){
		document.payForm.totalCost.value=5000;
		document.payForm.remainCost.value=5000;
	}
	function payCount8(){
		document.payForm.totalCost.value=8000;
		document.payForm.remainCost.value=8000;
	}
	function payCount10(){
		document.payForm.totalCost.value=10000;
		document.payForm.remainCost.value=10000;
	}
	
	function insertSeatNo1(){
		document.payForm.seatNo.value=1;
	}
	function insertSeatNo2(){
		document.payForm.seatNo.value=2;
	}
	function insertSeatNo3(){
		document.payForm.seatNo.value=3;
	}
	function insertSeatNo4(){
		document.payForm.seatNo.value=4;
	}
	function insertSeatNo5(){
		document.payForm.seatNo.value=5;
	}
	function insertSeatNo6(){
		document.payForm.seatNo.value=6;
	}
	function insertSeatNo7(){
		document.payForm.seatNo.value=7;
	}
	function insertSeatNo8(){
		document.payForm.seatNo.value=8;
	}
	function insertSeatNo9(){
		document.payForm.seatNo.value=9;
	}
	function insertSeatNo10(){
		document.payForm.seatNo.value=10;
	}
	function insertSeatNo11(){
		document.payForm.seatNo.value=11;
	}
	function insertSeatNo12(){
		document.payForm.seatNo.value=12;
	}
	function insertSeatNo13(){
		document.payForm.seatNo.value=13;
	}
	function insertSeatNo14(){
		document.payForm.seatNo.value=14;
	}
	function insertSeatNo15(){
		document.payForm.seatNo.value=15;
	}
	function insertSeatNo16(){
		document.payForm.seatNo.value=16;
	}
	function insertSeatNo17(){
		document.payForm.seatNo.value=17;
	}
	function insertSeatNo18(){
		document.payForm.seatNo.value=18;
	}
	function insertSeatNo19(){
		document.payForm.seatNo.value=19;
	}
	function insertSeatNo20(){
		document.payForm.seatNo.value=20;
	}
	function insertSeatNo21(){
		document.payForm.seatNo.value=21;
	}
	function insertSeatNo22(){
		document.payForm.seatNo.value=22;
	}
	function insertSeatNo23(){
		document.payForm.seatNo.value=23;
	}
	function insertSeatNo24(){
		document.payForm.seatNo.value=24;
	}
	function insertSeatNo25(){
		document.payForm.seatNo.value=25;
	}
	function insertSeatNo26(){
		document.payForm.seatNo.value=26;
	}
	function insertSeatNo27(){
		document.payForm.seatNo.value=27;
	}
	function insertSeatNo28(){
		document.payForm.seatNo.value=28;
	}
	function insertSeatNo29(){
		document.payForm.seatNo.value=29;
	}
	function insertSeatNo30(){
		document.payForm.seatNo.value=30;
	}
	
	
	
	function insertMoney(){
		
		var insertCost = Number(document.payForm.insertCost.value);
		insertCost+=1000;
		document.payForm.insertCost.value=insertCost;
		document.payForm.remainCost.value-=1000;
		if(document.payForm.remainCost.value==0){
			alert("결제버튼을 눌러주세요");
			document.getElementById("insert").disabled = true;
		}
	}
	
</script>
<link type="text/css" rel="stylesheet" href="css/common.css">
</head>
<body>
<h2 align="center">좌석배정시스템</h2><p>
<%
	int onNumber = dao.onNumber();
	int offNumber = dao.offNumber();
%>
<table width="1200px" border="1">
	<tr width="1200px">
		<td width="600px" align="center">사용가능좌석 : <%=onNumber%></td>
		<td width="600px" align="center">빈좌석 : <%=offNumber%></td>
	</tr>
</table>
<hr>
<form id="payForm" name="payForm" action="/pcm/seatcontroller?action=payCharge" method="post">

	<table width="1200px"  border="1" height="800px">
		<tr width= "1200px">
			<td align ="center" valign="middle" width="300">
						<table width="300" height="650" >
							<tr>
								<td colspan="2" height="50"></td>
							</tr>
							<tr>
								<td width="150px" height="150px" bordercolor="write"> 
									<IMG SRC="seatImg/cal01.jpg" align="center"  width="150px" height="150px" onclick ="payCount1()">
								</td>
								<td width="150px" height="150px" bordercolor="write"> 
									<IMG SRC="seatImg/cal02.jpg" align="center"  width="150px" height="150px" onclick="payCount2()">
								</td>
							</tr>
							<tr>
								<td colspan="2" height="50"></td>
							</tr>
							<tr>
								<td width="150px" height="150px" bordercolor="write"> 
									<IMG SRC="seatImg/cal03.jpg" align="center"  width="150px" height="150px"onclick="payCount3()">
								</td>
								<td width="150px" height="150px" bordercolor="write"> 
									<IMG SRC="seatImg/cal04.jpg" align="center"  width="150px" height="150px" onclick="payCount5()">
								</td>
							</tr>
							<tr>
								<td colspan="2" height="50"></td>
							</tr>
							<tr>
								<td width="150px" height="150px" bordercolor="write"> 
									<IMG SRC="seatImg/cal05.jpg" align="center"  width="150px",height="150px" onclick="payCount8()">
								</td>
								<td width="150px" height="150px" bordercolor="write"> 
									<IMG SRC="seatImg/cal06.jpg" align="center"  width="150px",height="150px" onclick="payCount10()">
								</td>
							</tr>
							<tr>
								<td colspan="2" height="50"></td>
							</tr>
									
						</table>
			</td>
			<td align ="center" valign="middle" width="300px">
				<table height="650px" width="300px">
					<tr  height="50px">
						<td>
							<h2  align="center" >결제화면</h2>
						</td>
					</tr>
					<tr>
						<td><h3>
							아이디 : <input type="text" id="memberId" name="memberId" placeholder="아이디를입력하세요"><br>
							좌석번호 : <input type="text" id="seatNo" name="seatNo" placeholder="좌석번호를 클릭해주세요" readonly><br><br><br>
							투입금액 : <input type="text" id="insertCost" name="insertCost" readonly>  원<br><br>
							남은금액 : <input type="text" id="remainCost" name="remainCost" readonly> 원<br><br>
							총금액   : <input type="text" id="totalCost" name="totalCost" readonly> 원<br><br>
									<input type="button" value = "1000원투입" align="left" id="insert" onclick="insertMoney()">
						</h3><td>
					</tr>
					<tr>
						<td>
							 <input type="submit" value="결제" >
						<td>
					</tr>
				</table>
			</td>
			
			<!-- 좌석 -->
			<td align ="center" valign="middle" width="600px" height="650px">
			<table width="600px" height="120px">
				<tr>
					<td colspan="5" height ="100px">
						<table border="1">
							<tr>
								<td width="300px" height="50px" align="center">
									<IMG SRC="seatImg/on.jpg" id ="seat30"  width="50px" height="30px">사용중
								</td>
								<td width="300px" height="120px" align="center">
									<IMG SRC="seatImg/off.jpg" id ="seat30"  width="50px" height="30px">사용가능
								</td>
							</tr>
						</table>
					</td>
					
				</tr>
				<tr>
				<td width="120px" height="113px">
					<%	if (list.get(0).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat01.jpg" id ="seat01" align="center"  width="120px" height="113px" onclick ="insertSeatNo1()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat01.jpg" id ="seat01" align="center"  width="120px" height="113px"onclick ="insertSeatNo1()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(1).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat02.jpg" id ="seat02" align="center"  width="120px" height="113px" onclick ="insertSeatNo2()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat02.jpg" id ="seat02" align="center"  width="120px" height="113px" onclick ="insertSeatNo2()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(2).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat03.jpg" id ="seat03" align="center"  width="120px" height="113px" onclick ="insertSeatNo3()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat03.jpg" id ="seat03" align="center"  width="120px" height="113px" onclick ="insertSeatNo3()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(3).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat04.jpg" id ="seat04" align="center"  width="120px" height="113px" onclick ="insertSeatNo4()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat04.jpg" id ="seat04" align="center"  width="120px" height="113px"  onclick ="insertSeatNo4()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(4).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat05.jpg" id ="seat05" align="center"  width="120px" height="113px"  onclick ="insertSeatNo5()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat05.jpg" id ="seat05" align="center"  width="120px" height="113px" onclick ="insertSeatNo5()">
					<% 	} %>
				</td>
				</tr>
				
				<tr>
				<td width="120px" height="113px">
					<%	if (list.get(5).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat06.jpg" id ="seat06" align="center"  width="120px" height="113px" onclick ="insertSeatNo6()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat06.jpg" id ="seat06" align="center"  width="120px" height="113px"  onclick ="insertSeatNo6()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(6).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat07.jpg" id ="seat07" align="center"  width="120px" height="113px"  onclick ="insertSeatNo7()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat07.jpg" id ="seat07" align="center"  width="120px" height="113px" onclick ="insertSeatNo7()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(7).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat08.jpg" id ="seat08" align="center"  width="120px" height="113px" onclick ="insertSeatNo8()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat08.jpg" id ="seat08" align="center"  width="120px" height="113px"  onclick ="insertSeatNo8()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(8).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat09.jpg" id ="seat09" align="center"  width="120px" height="113px"  onclick ="insertSeatNo9()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat09.jpg" id ="seat09" align="center"  width="120px" height="113px" onclick ="insertSeatNo9()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(9).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat10.jpg" id ="seat10" align="center"  width="120px" height="113px"  onclick ="insertSeatNo10()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat10.jpg" id ="seat10" align="center"  width="120px" height="113px" onclick ="insertSeatNo10()">
					<% 	} %>
				</td>
				</tr>
				
				<tr>
				<td width="120px" height="113px">
					<%	if (list.get(10).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat11.jpg" id ="seat11" align="center"  width="120px" height="113px" onclick ="insertSeatNo11()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat11.jpg" id ="seat11" align="center"  width="120px" height="113px" onclick ="insertSeatNo11()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(11).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat12.jpg" id ="seat12" align="center"  width="120px" height="113px" onclick ="insertSeatNo12()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat12.jpg" id ="seat12" align="center"  width="120px" height="113px"  onclick ="insertSeatNo12()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(12).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat1.jpg" id ="seat13" align="center"  width="120px" height="113px" onclick ="insertSeatNo13()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat13.jpg" id ="seat13" align="center"  width="120px" height="113px" onclick ="insertSeatNo13()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(13).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat14.jpg" id ="seat14" align="center"  width="120px" height="113px" onclick ="insertSeatNo14()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat14.jpg" id ="seat14" align="center"  width="120px" height="113px" onclick ="insertSeatNo14()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(14).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat15.jpg" id ="seat15" align="center"  width="120px" height="113px"  onclick ="insertSeatNo15()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat15.jpg" id ="seat15" align="center"  width="120px" height="113px" onclick ="insertSeatNo15()">
					<% 	} %>
				</td>
				</tr>
				
				<tr>
				<td width="120px" height="113px">
					<%	if (list.get(15).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat16.jpg" id ="seat16" align="center"  width="120px" height="113px"  onclick ="insertSeatNo16()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat16.jpg" id ="seat16" align="center"  width="120px" height="113px"  onclick ="insertSeatNo16()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(16).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat17.jpg" id ="seat17" align="center"  width="120px" height="113px"  onclick ="insertSeatNo17()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat17.jpg" id ="seat17" align="center"  width="120px" height="113px"  onclick ="insertSeatNo17()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(17).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat18.jpg" id ="seat18" align="center"  width="120px" height="113px"  onclick ="insertSeatNo18()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat18.jpg" id ="seat18" align="center"  width="120px" height="113px"  onclick ="insertSeatNo18()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(18).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat19.jpg"  id ="seat19" align="center"  width="120px" height="113px"  onclick ="insertSeatNo19()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat19.jpg" id ="seat19" align="center"  width="120px" height="113px"  onclick ="insertSeatNo19()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
				<%	if (list.get(19).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat20.jpg" id ="seat20" align="center"  width="120px" height="113px"  onclick ="insertSeatNo20()">
				<%	} else { %>
						<IMG SRC="seatImg/offseat20.jpg" id ="seat20" align="center"  width="120px" height="113px" onclick ="insertSeatNo20()">
				<% 	} %>
				</td>
				</tr>
				
				<tr>
				<td width="120px" height="113px">
					<%	if (list.get(20).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat21.jpg" id ="seat21" align="center"  width="120px" height="113px"onclick ="insertSeatNo21()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat21.jpg" id ="seat21" align="center"  width="120px" height="113px"onclick ="insertSeatNo21()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(21).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat22.jpg" id ="seat22" align="center"  width="120px" height="113px" onclick ="insertSeatNo22()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat22.jpg" id ="seat22" align="center"  width="120px" height="113px"onclick ="insertSeatNo22()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(22).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat23.jpg" id ="seat23" align="center"  width="120px" height="113px" onclick ="insertSeatNo23()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat23.jpg" id ="seat23" align="center"  width="120px" height="113px" onclick ="insertSeatNo23()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(23).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat24.jpg" id ="seat24" align="center"  width="120px" height="113px" onclick ="insertSeatNo24()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat24.jpg" id ="seat24" align="center"  width="120px" height="113px" onclick ="insertSeatNo24()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(24).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat25.jpg" id ="seat25" align="center"  width="120px" height="113px" onclick ="insertSeatNo25()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat25.jpg" id ="seat25" align="center"  width="120px" height="113px" onclick ="insertSeatNo25()">
					<% 	} %>
				</td>
				</tr>
				
				<tr>
				<td width="120px" height="113px">
					<%	if (list.get(25).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat26.jpg" id ="seat26" align="center"  width="120px" height="113px" onclick ="insertSeatNo26()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat26.jpg" id ="seat26" align="center"  width="120px" height="113px"onclick ="insertSeatNo26()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(26).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat27.jpg" id ="seat28" align="center"  width="120px" height="113px" onclick ="insertSeatNo27()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat27.jpg" id ="seat28" align="center"  width="120px" height="113px" onclick ="insertSeatNo27()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(27).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat28.jpg" id ="seat29" align="center"  width="120px" height="113px"onclick ="insertSeatNo28()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat28.jpg" id ="seat29" align="center"  width="120px" height="113px"onclick ="insertSeatNo28()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(28).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat29.jpg" id ="seat29" align="center"  width="120px" height="113px"onclick ="insertSeatNo29()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat29.jpg" id ="seat29" align="center"  width="120px" height="113px"onclick ="insertSeatNo29()">
					<% 	} %>
				</td>
				<td width="120px" height="113px">
					<%	if (list.get(29).getCondition() == 1) { %>
						<IMG SRC="seatImg/onseat30.jpg" id ="seat30" align="center"  width="120px" height="113px"onclick ="insertSeatNo30()">
					<%	} else { %>
						<IMG SRC="seatImg/offseat30.jpg" id ="seat30" align="center"  width="120px" height="113px"onclick ="insertSeatNo30()">
					<% 	} %>
				</td>
				</tr>
				
		</table>
	</table>
</form>


</body>
</html>