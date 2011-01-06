//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 the original author or authors
// 
////////////////////////////////////////////////////////////////////////////////

package org.swiftsuspenders.processors
{
	import org.swiftsuspenders.Injector;
	import org.swiftsuspenders.injectionpoints.InjectionPoint;
	import org.swiftsuspenders.processors.IMetadataProcessor;
	import org.swiftsuspenders.processors.impl.PostConstructMetadataProcessor;
	import org.swiftsuspenders.support.nodes.InjectionNodes;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  06.01.2011
	 */
	public class PostConstructMetadataProcessorTests
	{
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var processor : IMetadataProcessor;
		
		//--------------------------------------
		//  SETUP
		//--------------------------------------
		
		[Before]
		public function setup( ) : void
		{
			processor = new PostConstructMetadataProcessor( );
		}
		
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
		
		[Test(description='throws error when trying to create injection point for properties',expected='org.swiftsuspenders.InjectorError')]
		public function test_throws_error_when_trying_to_create_injection_point_for_properties( ) : void
		{
			var node : XML = XML( InjectionNodes.PROPERTY_INJECTION_NODE.metadata );
			
			var point : InjectionPoint = processor.createPropertyInjectionPoint( node, new Injector( ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function PostConstructMetadataProcessorTests( )
		{
		}
	
	}

}
