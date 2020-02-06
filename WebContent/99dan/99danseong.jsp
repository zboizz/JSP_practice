<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		response.setCharacterEncoding("EUC-KR");
		
%>

<html>
<head>
<title>my first 구구단.jsp</title>
<style>
	body { background :#E85A58 }
	h1 { color : #FFBF66;
		   font-weight : bolder;
		   }
	
	td:hover { background : black; }
	th:hover { background : black; }
	
	thead{ 
			   background : #43373a;
			}
	
	th { height : 60px;
		  test-align : center; 
		  font-weight : bolder;
		  font-size : x-large;
		  /*border-radius : 10px;*/
		  }
	.th-top_left-radius {
								 border-top-left-radius : 10px;
	}
	
	.th-top_right-radius {
								 border-top-right-radius : 10px;
	}
	
	.td-bot_left-radius-dark {
							     border-bottom-left-radius : 10px;
							     background : #ea6462;
	}
	
	.td-bot_right-radius-dark {
								 border-bottom-right-radius : 10px;
								 background : #ea6462;
	}
	
	.td-light {
				  background : #fc7a78;
	}
	
	.td-dark {
				  background : #ea6462;
	}
	
	tr, td { align : center;
			  text-align : center; 
			  font-weight : normal;
			  /*border-radius : 10px;*/
			  }
	
	.bodywrap { border-radius : 10px;
					  /*border : 2px solid black;*/
	}
	
	.table { border : 1px;
				border-collapse : collapse;
				table-layout : auto;
				width : 900px;
				height : 600px;
				text-align : center;
				align : center;
				}
	

</style>
</head>
<body>
	<br/>
		<h1 align="center">
			구 구 단
		</h1>
		<br />

		

	<div class="bodywrap">
		<table class="table" align="center">
			<thead>
				<tr>
					<th
 class = "th-top_left-radius"
><font color = "#FFBF66">1 단</font></th>
<th
><font color = "#FFBF66">2 단</font></th>
<th
><font color = "#FFBF66">3 단</font></th>
<th
><font color = "#FFBF66">4 단</font></th>
<th
><font color = "#FFBF66">5 단</font></th>
<th
><font color = "#FFBF66">6 단</font></th>
<th
><font color = "#FFBF66">7 단</font></th>
<th
><font color = "#FFBF66">8 단</font></th>
<th
 class = "th-top_right-radius"
><font color = "#FFBF66">9 단</font></th>

				
			</thead>
			<tbody>
				</tr>
				<tr>
<td
 class = "td-dark"
><font color = "#FFFF35">1 x 1 = 1</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">2 x 1 = 2</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">3 x 1 = 3</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">4 x 1 = 4</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">5 x 1 = 5</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">6 x 1 = 6</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">7 x 1 = 7</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">8 x 1 = 8</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">9 x 1 = 9</font></td>
</tr>
<tr>
<td
 class = "td-light"
><font color = "#FFFF35">1 x 2 = 2</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">2 x 2 = 4</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">3 x 2 = 6</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">4 x 2 = 8</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">5 x 2 = 10</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">6 x 2 = 12</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">7 x 2 = 14</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">8 x 2 = 16</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">9 x 2 = 18</font></td>
</tr>
<tr>
<td
 class = "td-dark"
><font color = "#FFFF35">1 x 3 = 3</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">2 x 3 = 6</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">3 x 3 = 9</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">4 x 3 = 12</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">5 x 3 = 15</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">6 x 3 = 18</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">7 x 3 = 21</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">8 x 3 = 24</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">9 x 3 = 27</font></td>
</tr>
<tr>
<td
 class = "td-light"
><font color = "#FFFF35">1 x 4 = 4</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">2 x 4 = 8</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">3 x 4 = 12</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">4 x 4 = 16</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">5 x 4 = 20</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">6 x 4 = 24</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">7 x 4 = 28</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">8 x 4 = 32</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">9 x 4 = 36</font></td>
</tr>
<tr>
<td
 class = "td-dark"
><font color = "#FFFF35">1 x 5 = 5</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">2 x 5 = 10</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">3 x 5 = 15</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">4 x 5 = 20</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">5 x 5 = 25</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">6 x 5 = 30</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">7 x 5 = 35</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">8 x 5 = 40</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">9 x 5 = 45</font></td>
</tr>
<tr>
<td
 class = "td-light"
><font color = "#FFFF35">1 x 6 = 6</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">2 x 6 = 12</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">3 x 6 = 18</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">4 x 6 = 24</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">5 x 6 = 30</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">6 x 6 = 36</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">7 x 6 = 42</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">8 x 6 = 48</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">9 x 6 = 54</font></td>
</tr>
<tr>
<td
 class = "td-dark"
><font color = "#FFFF35">1 x 7 = 7</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">2 x 7 = 14</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">3 x 7 = 21</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">4 x 7 = 28</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">5 x 7 = 35</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">6 x 7 = 42</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">7 x 7 = 49</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">8 x 7 = 56</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">9 x 7 = 63</font></td>
</tr>
<tr>
<td
 class = "td-light"
><font color = "#FFFF35">1 x 8 = 8</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">2 x 8 = 16</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">3 x 8 = 24</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">4 x 8 = 32</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">5 x 8 = 40</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">6 x 8 = 48</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">7 x 8 = 56</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">8 x 8 = 64</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">9 x 8 = 72</font></td>
</tr>
<tr>
<td
 class = "td-bot_left-radius-dark"
><font color = "#FFFF35">1 x 9 = 9</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">2 x 9 = 18</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">3 x 9 = 27</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">4 x 9 = 36</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">5 x 9 = 45</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">6 x 9 = 54</font></td>
<td
 class = "td-dark"
><font color = "#FFFF35">7 x 9 = 63</font></td>
<td
 class = "td-light"
><font color = "#FFFF35">8 x 9 = 72</font></td>
<td
 class = "td-bot_right-radius-dark"
><font color = "#FFFF35">9 x 9 = 81</font></td>
</tr>

			</tbody>
		</table>
	</div>
</body>
</html>