<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<div id="main" class="scroll-container">
			<section class="section1">
				<div>
				</div>
			</section>
			<section class="section2">
				<div>
							
				</div>
			</section>
			<section class="section3">
				<div>
							
				</div>
			</section>
			<section class="section4">
				<div>
									
				</div>
			</section>
			<section class="section5">
				<div>
				</div>
				<%@ include file="/WEB-INF/views/common/footer.jsp"%>			
			</section>
		</div>
		
</body>
	<script src="<%=request.getContextPath() %>/js/main/full-page-scroll.js"></script>
	<script type="text/javascript">
		new fullScroll({
			displayDots: true,
			dotsPosition: 'left',
			animateTime: 0.7,
			animateFunction: 'ease'
		});
	</script>
</html>