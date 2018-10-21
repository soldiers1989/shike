package com.kensure.interceptor;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 用户锁
 * @author fankd
 *
 */
public class KeyLock{

	private static Map<String,ReentrantLock> lockmap = new HashMap<>();

	/**
	 * 本地线程变量，防止高并发时瞎解锁
	 */
	private static ThreadLocal<String> userlocal = new ThreadLocal<String>();
	
	public static void doLock(String userid){
		userlocal.set(null);
		ReentrantLock lock = lockmap.get(userid);
		if(lock == null){
			lock = createLock(userid);
		}
		lock.lock();
		userlocal.set(userid);
	}
	
	private synchronized static ReentrantLock createLock(String userid){
		ReentrantLock lock = lockmap.get(userid);
		if(lock == null){
			lock = new ReentrantLock();
			lockmap.put(userid, lock);
		}
		return lock;
	}

	public static void unlock(){
		if(userlocal.get() != null){
			ReentrantLock lock = lockmap.get(userlocal.get());
			if(lock != null){
				lock.unlock();
			}
			userlocal.set(null);
		}	
	}
	
}