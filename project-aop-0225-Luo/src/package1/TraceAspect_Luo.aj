package package1;

public aspect TraceAspect_Luo 
{
	pointcut classToTrace(): within(ComponentApp) || within(DataApp) || within(ServiceApp);
	pointcut trace(): classToTrace() && execution(String getName());
	before(): trace() 
	{
	      String info = thisJoinPointStaticPart.getSignature() + ", " //
	            + thisJoinPointStaticPart.getSourceLocation().getLine();
	      System.out.println("[BGN] " + info);
	 }

	   after(): trace() 
	   {
	      System.out.println("[END] " + thisJoinPointStaticPart.getSourceLocation().getFileName());
	   }
	

}
