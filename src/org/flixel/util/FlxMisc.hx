package org.flixel.util;

import flash.Lib;
import flash.net.URLRequest;
import org.flixel.FlxGame;

/**
 * A class containing random functions that didn't 
 * fit in any other class of the util package.
 */
class FlxMisc 
{
	/**
	 * Opens a web page in a new tab or window.
	 * 
	 * @param	URL		The address of the web page.
	 */
	inline static public function openURL(URL:String):Void
	{
		Lib.getURL(new URLRequest(URL), "_blank");
	}
	
	/**
	 * Just grabs the current "ticks" or time in milliseconds that has passed since Flash Player started up.
	 * Useful for finding out how long it takes to execute specific blocks of code.
	 * @return	Time in milliseconds that has passed since Flash Player started up.
	 */
	inline static public function getTicks():Int
	{
		return FlxGame._mark;
	}
	
	/**
	 * Check to see if two objects have the same class name.
	 * @param	Object1		The first object you want to check.
	 * @param	Object2		The second object you want to check.
	 * @return	Whether they have the same class name or not.
	 */
	@:extern inline static public function compareClassNames(Object1:Dynamic, Object2:Dynamic):Bool
	{
		return Type.getClassName(Object1) == Type.getClassName(Object2);
	}
	
	/**
	 * Get the <code>String</code> name of any <code>Object</code>.
	 * @param	Obj		The <code>Object</code> object in question.
	 * @param	Simple	Returns only the class name, not the package or packages.
	 * @return	The name of the <code>Class</code> as a <code>String</code> object.
	 */
	@:extern inline static public function getClassName(Obj:Dynamic, Simple:Bool = false):String
	{
		var s:String = Type.getClassName(Type.getClass(Obj));
		if (s != null)
		{
			s = StringTools.replace(s, "::", ".");
			if (Simple)
			{
				s = s.substr(s.lastIndexOf(".") + 1);
			}
		}
		return s;
	}
}