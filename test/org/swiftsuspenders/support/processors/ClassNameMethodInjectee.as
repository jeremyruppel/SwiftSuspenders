//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 the original author or authors
// 
////////////////////////////////////////////////////////////////////////////////

package org.swiftsuspenders.support.processors
{

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  06.01.2011
	 */
	public class ClassNameMethodInjectee extends Object
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function ClassNameMethodInjectee( )
		{
		}

		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		
		public var className : String = '';
		
		[ClassName]
		public function setClassName( value : String ) : void
		{
			className = value;
		}
		
	}

}