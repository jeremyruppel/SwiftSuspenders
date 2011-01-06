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
	import flash.utils.describeType;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  06.01.2011
	 */
	public class ClassNamePropertyInjectionPoint extends InjectionPoint
	{
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		/**
		 * @private
		 */
		private var propertyName : String;
		
		/**
		 * @private
		 */
		private var propertyType : String;
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function ClassNamePropertyInjectionPoint( node : XML, injector : Injector )
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
			target[ propertyName ] = getQualifiedClassName( target );
			return target;
		}
		
		
		/**
		 * @inheritDoc
		 */
		override protected function initializeInjection( node : XML, injector : Injector ) : void
		{
			propertyName = node.parent( ).@name.toString( );
			propertyType = node.parent( ).@type.toString( );
			/*
				TODO this would be a good place to throw an error if the property's type is not 'String'
			*/
		}
	
	}

}