package eVote;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DAO {
	Connection conn;
	Statement stmt;
	PreparedStatement ps;
	ResultSet rs;
	void connect () throws Exception {
		Class c = Class.forName("oracle.jdbc.driver.OracleDriver");
		// forName loads the class from HDD to MM
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "evs", "evs");
		System.out.println("Connected");
	}
	public boolean login(String un, String pw) throws Exception
	{
		connect();
		stmt = conn.createStatement();
		ResultSet rs= stmt.executeQuery("select * from evs_tbl_user where usern='"+ un +"' and pass='"+ pw+ "'");
		if(rs.next()){
			return true;}
			else return false;
	}
	public boolean signup(String nm, String email, String user1, String pass, String mn, String gn, String dob, String add, String cons) throws Exception{
		connect();
		PreparedStatement ps = conn.prepareStatement("insert into EVS_TBL_user values(?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1, nm);
		ps.setString(2, email);
		
		ps.setString(3, user1);
		ps.setString(4, pass);
		ps.setString(5, dob);
		ps.setString(6, gn);
		ps.setString(7, mn);
		ps.setString(8, add);
		ps.setString(9, "U");
		ps.setString(10, "N");
		ps.setInt(11, 0);
		ps.setString(12, cons);
		int r=ps.executeUpdate();
		if(r==1){
		return true;
		}
			return false;
	}
	public boolean signup1(String nm, String email, String party, String mn, String gn, String dob, String Const, String state, String dist) throws Exception{
		connect();
		PreparedStatement ps = conn.prepareStatement("insert into EVS_TBL_CAND values(?,?, 'CAND'||seq1.nextval,?,?,?,?,?,?,?,0,0)");
		ps.setString(1, nm);
		ps.setString(2, email);
		
		ps.setString(3, party);
		ps.setString(4, dob);
		ps.setString(5, gn);
		ps.setString(6, mn);
		ps.setString(7, Const);
		ps.setString(8, dist);
		ps.setString(9, state);
		int r=ps.executeUpdate();
		if(r==1){
		return true;
		}
		return false;
	}
	public String candid(String email) throws Exception{
		connect();
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select cand from EVS_TBL_CAND where email = '"+ email +"'");
		rs.next();
		System.out.print("1");
		System.out.print(rs.getString("cand"));
		return rs.getString("cand");
	}
	public ResultSet cand(String choice) throws Exception{
		connect();
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from EVS_TBL_CAND where party = '"+ choice +"' and approve=" +1);
		return rs;
	}
	public boolean signup2(String nm, String email, String lnm, String mn, String sym, String det) throws Exception{
		connect();
		stmt = conn.createStatement();
		int rowcount = stmt.executeUpdate("insert into evs_tbl_party values ('" + nm +"','" + lnm +"','" + email +"','" + mn +"','" + sym +"','" + det +"'," + 0 +","+ 0 +")");
		if(rowcount != 0)
			return true;
		else
			return false;
	}
	public boolean edit(String nm, String user1, String mn, String gn, String dob, String add) throws Exception{
		connect();
		stmt = conn.createStatement();
		PreparedStatement ps = conn.prepareStatement("update evs_tbl_user set name = ?, DOB = ?, GENDER = ?, ADDRESS = ? where USERN = ?");
		ps.setString(1, nm);
		ps.setString(2, dob);
		
		ps.setString(3, gn);
		ps.setString(4, add);
		ps.setString(5, user1);
		int r=ps.executeUpdate();
		if(r==1){
		return true;
		}
			return false;
	}
	public String check(String name) throws Exception{
		connect();
		PreparedStatement ps = conn.prepareStatement("select type from evs_tbl_user where usern=?");
		ps.setString(1, name);
		ResultSet rs = ps.executeQuery();
		rs.next();
		System.out.println(rs.getString(1));
		return rs.getString(1);
	}
	public ResultSet fetch(String un) throws Exception{
		connect();
		stmt = conn.createStatement();
		ResultSet rs= stmt.executeQuery("select * from evs_tbl_user where usern='"+ un +"'");
		rs.next();
		
		System.out.print("I love you");
		System.out.print(rs.getString("con"));
		return rs;
		
	}
	public ResultSet party() throws Exception
	{	
		connect();
		stmt = conn.createStatement();
		ResultSet rs= stmt.executeQuery("select * from evs_tbl_party where approve=" + 1);
		return rs;
		
	}
	public ResultSet partyd(String choice) throws Exception
	{	
		connect();
		stmt = conn.createStatement();
		ResultSet rs= stmt.executeQuery("select * from evs_tbl_party where approve=" + 1+"and name='"+choice+"'");
		rs.next();
		return rs;
		
	}
	public ResultSet ucandlist(String const1) throws Exception{
		connect();
		stmt = conn.createStatement();
		ResultSet rs= stmt.executeQuery("select * from evs_tbl_cand where const='"+ const1 +"' and approve=" + 1);
		
		
		return rs;
	}
	public boolean change(String un, String npw) throws Exception{
		connect();
		PreparedStatement ps = conn.prepareStatement("update evs_tbl_user set pass = ? where usern = ?");
		ps.setString(1, npw);
		ps.setString(2, un);
		int r=ps.executeUpdate();
		if(r==1){
		return true;
		}
		return false;
		
	}
	public boolean pendding(String un, String adpd, String uadpd, String dobd, String udobd, String add, String name) throws Exception
	{
		connect();
		PreparedStatement ps = conn.prepareStatement("update evs_tbl_user set VOTER_ID = 'A' where usern = ?");
		ps.setString(1, un);
		int r = ps.executeUpdate();
		PreparedStatement s = conn.prepareStatement("insert into PENDING values(?,'CITI'||seq1.nextval,?,?,?,?,?,?)");
		s.setString(1, add);
		s.setString(2, adpd);
		s.setString(3, uadpd);
		s.setString(4, dobd);
		s.setString(5, udobd);
		s.setString(6, name);
		s.setString(7, un);
		int rs = s.executeUpdate();
		if(rs !=0){
			return true;
		}
		else return false;
		
	}
	public ResultSet viewcandidates(String clas) throws Exception
	{connect();
	PreparedStatement ps;
	if(clas.equals("a")){
	 ps = conn.prepareStatement("select Name,Party,CONST,Approve from EVS_TBL_Cand where Approve=1");
	}
	else{ ps = conn.prepareStatement("select Name,Party,Const,Approve from EVS_TBL_Cand");
	}
	ResultSet rs = ps.executeQuery();
		return rs;}
	public ResultSet viewschedule(String clas) throws Exception
	{connect();
	PreparedStatement ps;
	if(clas.equals("a")){
	ps = conn.prepareStatement("select * from EVS_TBL_Election where Electiondate!='null'");
	}
	else{ps = conn.prepareStatement("select * from EVS_TBL_Election");
	}
	ResultSet rs = ps.executeQuery();
	ps = conn.prepareStatement("select * from EVS_TBL_Election where Electiondate!='null'");
		return rs;}
	public ResultSet uviewschedule(String con) throws Exception
	{connect();
	PreparedStatement ps;
	ps = conn.prepareStatement("select * from EVS_TBL_Election where Electiondate!='null' and CONSTITUENCY ='"+ con+"'");
	ResultSet rs = ps.executeQuery();
	rs.next();
	return rs;
	}
	public boolean addcandidates(String Partyname,String Constituency,String Name) throws Exception
	{connect();
	PreparedStatement ps;
	ResultSet rs;
	ps = conn.prepareStatement("update EVS_TBL_Candidate set Approve=1 where Constituency=? and Partyname=?");
	ps.setString (1, Constituency);
	ps.setString (2, Partyname);
	int r = ps.executeUpdate();
	if(r==1)
		{ps = conn.prepareStatement("insert into EVS_TBL_Result values(?,?,?,0)");
	ps.setString (1,Constituency);
	ps.setString (2,Partyname);
	ps.setString (3,Name);
	int p = ps.executeUpdate();	
	ps = conn.prepareStatement("select Constituency from EVS_TBL_Election where Constituency=?");
	ps.setString (1,Constituency);
	rs=ps.executeQuery();
	rs.next();
	if(rs.getString("Constituency")!=Constituency)
	{
	ps = conn.prepareStatement("insert into EVS_TBL_Election values('null',?,'null')");
	ps.setString (1,Constituency);
	p = ps.executeUpdate();	}
	return true;}
	else
	return false;
}
	public boolean cast(String Constituency,String Party,String Userid) throws Exception
{   connect();
PreparedStatement ps;
ResultSet rs;
ps = conn.prepareStatement("select Voted,VoterId from EVS_TBL_Application where Userid=?");
ps.setString (1, Userid);
rs = ps.executeQuery();
rs.next();
if((!rs.getString("Voted").equals("1"))&&(!rs.getString("VoterId").equals("null")))
{
	ps = conn.prepareStatement("update EVS_TBL_Result set Votecount=Votecount+1 where Constituency=? and Party=?");
	ps.setString (1, Constituency);
	ps.setString (2, Party);
	int r = ps.executeUpdate();
	return true;
}
	else
	return false;
}
	public ResultSet pending(String Constituency,String edate) throws Exception
	{
		connect();
		ps = conn.prepareStatement("select Electiondate from EVS_TBL_Election where Constituency=?");
		ps.setString (1, Constituency);
		rs = ps.executeQuery();
		rs.next();
		if(rs.getString("Electiondate").equals(edate))
		{
		//ps = conn.prepareStatement("select Partyname,CandidateName from EVS_TBL_Result where Constituency=?");
		//ps.setString (1, Constituency);
		//rs = ps.executeQuery();
			stmt = conn.createStatement();
			ResultSet rs= stmt.executeQuery("select * from evs_tbl_cand where const='"+ Constituency +"' and approve=" + 1);
		return rs;
		}
		else{rs=null;}
		return rs;
	}
	public void scast(String cand, String name) throws Exception{
		connect();
		stmt = conn.createStatement();
		PreparedStatement ps = conn.prepareStatement("update evs_tbl_user set count = 1 where USERN = ?");
		ps.setString(1, name);
		int r =ps.executeUpdate();
		PreparedStatement qs = conn.prepareStatement("update evs_tbl_cand set VOTE_COUNT =VOTE_COUNT + 1 where name = ?");
		qs.setString(1, cand);
		int w =qs.executeUpdate();
		
		
	}
	public boolean countdate(String dateval) throws Exception{
		connect();
		ps = conn.prepareStatement("select * from EVS_TBL_Election");
		ResultSet rs = ps.executeQuery();
		rs.next();
		if(rs.getString("COUNTINGDATE").equals(dateval))
			return true;
		else return false;
		
	}
	public ResultSet result() throws Exception{
		connect();
		ps = conn.prepareStatement("select CONSTITUENCY from EVS_TBL_Election");
		ResultSet rs = ps.executeQuery();
		return rs;
	}
	public String count(String con) throws Exception{
		connect();
		ps = conn.prepareStatement("select NAME, VOTE_COUNT from EVS_TBL_Cand where CONST='"+ con+"'");
		ResultSet rs = ps.executeQuery();
		rs.next();
		int max=rs.getInt("VOTE_COUNT");
		String name=rs.getString("NAME");
		for(int i=1;i<rs.getRow();i++){
			rs.next();
			if(max<rs.getInt("VOTE_COUNT"))
			{
				max=rs.getInt("VOTE_COUNT");
				name=rs.getString("NAME");
			}
		}
		
		
		return name;
		
	}
	public String getParty(String cand) throws Exception{
		connect();
		ps = conn.prepareStatement("select PARTY from EVS_TBL_Cand where Name=?");
		ResultSet rs = ps.executeQuery();
		rs.next();
		return rs.getString("Party");
	}
	public boolean finaly(String CONSTITUENCY, String PARTYNAME, String CANDIDATENAME) throws Exception{
		connect();
		PreparedStatement ps = conn.prepareStatement("insert into EVS_TBL_Result values(?,?,?)");
		ps.setString(1, CONSTITUENCY);
		ps.setString(2, PARTYNAME);
		
		ps.setString(3, CANDIDATENAME);
		int row =ps.executeUpdate();
		PreparedStatement qs = conn.prepareStatement("update evs_tbl_party set SEAT = SEAT +1 where NAME = ?");
		ps.setString(1, PARTYNAME);
		int row1 = qs.executeUpdate();
		if(row1!=0){
			return true;
		}
		else return false;
	}
	public ResultSet result1() throws Exception{
		connect();
		ps = conn.prepareStatement("select * from EVS_TBL_Result");
		ResultSet res=ps.executeQuery();
		return res;
	}
	public ResultSet pend() throws Exception{
		connect();
		ps = conn.prepareStatement("select * from Pending");
		ResultSet res=ps.executeQuery();
		return res;
	}
	public String symbol(String Party) throws Exception
{		connect();
 		ps = conn.prepareStatement("select Symbol from EVS_TBL_Party where NAME=?");
 		ps.setString (1, Party);
 		rs = ps.executeQuery();
 		rs.next();
 		return rs.getString("Symbol");
 }
	public boolean addvoter(String name) throws Exception{
		connect();
		PreparedStatement gs=conn.prepareStatement("select * from Pending where usern=?");
		gs.setString(1, name);
		ResultSet gs1= gs.executeQuery();
		gs1.next();
		String vote= gs1.getString("UNNO");
		System.out.print(vote);
 		PreparedStatement qs=conn.prepareStatement("update evs_tbl_user set VOTER_ID = ? where USERN = ?");
 		qs.setString(1, vote);
 		qs.setString(2, name);
 		int r=qs.executeUpdate();
		ps = conn.prepareStatement("delete from pending where usern = ?");
 		ps.setString (1, name);
 		int row = ps.executeUpdate();

		return true;
 	
	}
	public boolean reject(String name) throws Exception{
		connect();
		PreparedStatement gs=conn.prepareStatement("select * from Pending where usern=?");
		gs.setString(1, name);
		ResultSet gs1= gs.executeQuery();
		gs1.next();
 		PreparedStatement qs=conn.prepareStatement("update evs_tbl_user set VOTER_ID ='R' where USERN = ?");
 		qs.setString(1, name);
 		int r=qs.executeUpdate();
		ps = conn.prepareStatement("delete from pending where usern = ?");
 		ps.setString (1, name);
 		int row = ps.executeUpdate();

		return true;

		
	}
	public ResultSet viewparty() throws Exception{
		connect();
		PreparedStatement gs=conn.prepareStatement("select * from evs_tbl_party where approve=0");
		rs= gs.executeQuery();
		return rs;
		
	}
	public boolean addparty(String name) throws Exception{
		connect();
		PreparedStatement qs=conn.prepareStatement("update evs_tbl_party set approve =1 where name = ?");
		qs.setString(1, name);
 		int r=qs.executeUpdate();
 		if(r!=0){
 			return true;
 		}
 		else return false;
	}
	public boolean reject1(String name) throws Exception{
		connect();
		PreparedStatement qs=conn.prepareStatement("delete from evs_tbl_party where name = ?");
		qs.setString(1, name);
 		int r=qs.executeUpdate();
 		if(r!=0){
 			return true;
 		}
 		else return false;
	}
	public ResultSet candidate() throws Exception{
		connect();
		PreparedStatement gs=conn.prepareStatement("select * from evs_tbl_cand where approve=0");
		rs= gs.executeQuery();
		
		return rs;
	}
	public boolean reject2(String cand) throws Exception{
		connect();
		PreparedStatement qs=conn.prepareStatement("delete from evs_tbl_cand where cand = ?");
		qs.setString(1, cand);
 		int r=qs.executeUpdate();
 		if(r!=0){
 			return true;
 		}
 		else return false;
	}
	public boolean addc(String cand) throws Exception{
		connect();
		PreparedStatement qs=conn.prepareStatement("update evs_tbl_cand set approve =1 where cand = ?");
		qs.setString(1, cand);
 		int r=qs.executeUpdate();
 		if(r!=0){
 			PreparedStatement vs= conn.prepareStatement("select const from evs_tbl_cand where cand=?");
 			vs.setString(1, cand);
 			ResultSet rs = vs.executeQuery();
 			rs.next();
 			String cast1=rs.getString("const");
 			PreparedStatement ts = conn.prepareStatement("select Constituency from EVS_TBL_Election where Constituency=?");
 			ts.setString (1,cast1);
 			ResultSet z= ts.executeQuery();
 			if(!z.next()){
 			ps=conn.prepareStatement("insert into evs_tbl_ELECTION values(null,?,null)");
 			ps.setString(1, cast1);
 			int x= ps.executeUpdate();
 			PreparedStatement gs=conn.prepareStatement("insert into evs_tbl_result values(?,null,null)");
 			gs.setString(1, cast1);
 			int y = gs.executeUpdate();
 			
 			return true;}
 		}
 		else return false;
		return false;
	}
	public ResultSet shedule() throws SQLException{
		ps=conn.prepareStatement("select * from evs_tbl_election");
		rs=ps.executeQuery();
		return rs;
	}
	public boolean shed(String Cons, String edate, String cdate) throws Exception{
		connect();
		ps=conn.prepareStatement("update evs_tbl_election set ELECTIONDATE=?, COUNTINGDATE=? where CONSTITUENCY=?");
		ps.setString(1, edate);
		ps.setString(2, cdate);
		ps.setString(3, Cons);
		System.out.println("A"+Cons);
		System.out.println(edate);
		System.out.println(cdate);
		int r =ps.executeUpdate();
		return true;
		
	}
	
}
