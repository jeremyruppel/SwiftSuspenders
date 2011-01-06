//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 the original author or authors
// 
////////////////////////////////////////////////////////////////////////////////

package org.swiftsuspenders.support.processors
{
	import flash.utils.getQualifiedClassName;
	import org.swiftsuspenders.Injector;
	import org.swiftsuspenders.injectionpoints.InjectionPoint;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  06.01.2011
	 */
	public class ClassNameMethodInjectionPoint extends InjectionPoint
	{
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		/**
		 * @private
		 */
		private var methodName : String;
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function ClassNameMethodInjectionPoint( node : XML, injector : Injector )
		{
			super( node, injector );
		}
	
		/**
		 * @param target Object
		 * @param injector Injector
		 * @return Object 
		 */
		override public function applyInjection( target : Object, injector : Injector ) : Object
		{
			target[ methodName ].apply( target, [ getQualifiedClassName( target ) ] );
			return target;
		}
		
		
		/**
		 * @inheritDoc
		 */
		override protected function initializeInjection( node : XML, injector : Injector ) : void
		{
			methodName = node.parent( ).@name.toString( );
			/*
				TODO this would be a good place to throw an error if the method does not accept a string parameter
			*/
		}
	
	}

}
