Set objParm = WScript.Arguments
Set fs = WScript.CreateObject("Scripting.FileSystemObject")
Set ts1 = fs.OpenTextFile(objParm(0),1)
Set ts2 = fs.OpenTextFile(objParm(0)+"_trim.txt",2,True)

Do Until ts1.AtEndOfStream
    rt = ts1.ReadLine
    If Len(rt) > 0 Then 
        ts2.WriteLine Left(rt,InStr(rt,",")-1)
    End If
Loop