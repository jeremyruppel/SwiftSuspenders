//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 the original author or authors
// 
////////////////////////////////////////////////////////////////////////////////

package org.swiftsuspenders.processors
{
	import org.swiftsuspenders.Injector;
	import org.swiftsuspenders.injectionpoints.InjectionPoint;

	/**
	 * Interface describing the contract for...
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  06.01.2011
	 */
	public interface IMetadataProcessor
	{
	
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
	
		/**
		 * creates an InjectionPoint subclass to process a property injection point
		 * @param node XML
		 * @param injector Injector
		 * @return InjectionPoint 
		 */
		function createPropertyInjectionPoint( node : XML, injector : Injector ) : InjectionPoint;
		
		/**
		 * creates an InjectionPoint subclass to process a method injection point
		 * @param node XML
		 * @param injector Injector
		 * @return InjectionPoint 
		 */
		function createMethodInjectionPoint( node : XML, injector : Injector ) : InjectionPoint;
	
		/**
		 * allows the processor to manipulate injection points after they have been identified
		 * @param injectionPoints Array
		 * @return Array 
		 */
		function postProcessInjectionPoints( injectionPoints : Array ) : Array;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
	
		/**
		 * provides the tag name to be processed by this processor
		 */
		function get tagName( ) : String;
	}

}
