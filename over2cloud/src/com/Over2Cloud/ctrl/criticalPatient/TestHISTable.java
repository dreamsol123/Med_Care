package com.Over2Cloud.ctrl.criticalPatient;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;

import hibernate.common.HisHibernateSessionFactory;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.Over2Cloud.CommonClasses.DateUtil;
import com.Over2Cloud.InstantCommunication.ConnectionHelper;
import com.Over2Cloud.service.clientdata.integration.ClientDataIntegration;
import com.Over2Cloud.service.clientdata.integration.ClientDataIntegrationHelper;

public class TestHISTable  extends Thread  {

	private static final Log log = LogFactory.getLog(TestHISTable.class);
	

	private static SessionFactory connection=null;
	private static Session sessionHis = null;
	private TestHISTableHelper CDIH =  new TestHISTableHelper();
	
	//private final T2mVirtualNoDataReceiver t2mvirtual=new T2mVirtualNoDataReceiver();
	
	public TestHISTable(SessionFactory connection, Session sessionHis ) {
		this.connection = connection;
	}
	
	public void run()
	{
			
				try{
					while(true){
					
						//t2mvirtual.getVirtualNoData(connection);
						 CDIH.tableGet(log, connection, sessionHis);
						// CDIH.datafetchForOrderEM(log, connection, sessionHis);
						System.out.println("Sleeping......................"+DateUtil.getCurrentDateIndianFormat()+" at "+DateUtil.getCurrentTime());
						Thread.sleep(1000*60*5);
						System.out.println("Woke Up......................."+DateUtil.getCurrentDateIndianFormat()+" at "+DateUtil.getCurrentTime());

						Runtime rt = Runtime.getRuntime();
						rt.gc();
	
					}
									}
				 catch (Exception e)
				 {
					 e.printStackTrace();
					 }
		
	}
	
	
	
	public static void main(String[] args) {
		Thread.State state ;
		try{
			
			System.out.println(">>>>>>>>>>>>>>>>>....Before Local DB connection");
			connection = new ConnectionHelper().getSessionFactory("IN-4");
			System.out.println("#@@@@@@@@@@@@@@@@@@@@@@@@After Local DB connection");
			System.out.println("Before HIS DB connection");
			sessionHis = HisHibernateSessionFactory.getSession();
			System.out.println("After HIS DB connection"+sessionHis);
			
				Thread uclient=new Thread(new TestHISTable(connection, sessionHis));
				System.out.println("Thread Created Successfuly!!");
				state = uclient.getState(); 
				System.out.println("Thread's State:: "+state);
			
				if(!state.toString().equalsIgnoreCase("RUNNABLE"))uclient.start();
				System.out.println("Thread Started Successfuly!!");
			
		}catch(Exception E){
			try {
				OutputStream out = new FileOutputStream(new File("c://output.txt"));
				byte[] b=E.toString().getBytes();
				out.write(b);
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			E.printStackTrace();
		}
	}






}
