val outf = TextIO.openOut;
			  
val output = TextIO.output;

val closeOut= TextIO.closeOut;

fun newLinerOut (a:string,b:int list) =
  let
      val my_out = outf a;
      
      fun print_nls(x:int) =
	let
	    fun p_nls(y:int,acc:string) = if y>0
					  then p_nls(y-1,"\n"^acc)
					  else acc
	in
	    p_nls(x,"")
	end
	    
      fun writeOut(currInt:int,intList:int list) =
	let
	    fun wOut(cI:int,iList:int list,acc:string) =
	      case iList
	       of nil => (output(my_out,acc);closeOut my_out)
		| _ => wOut(hd(iList),tl(iList),acc^(print_nls(hd(iList)-cI))^Int.toString(hd(iList)))
	in
	    wOut(currInt,intList,"")
	end
  in
      writeOut(1,b)
  end;
