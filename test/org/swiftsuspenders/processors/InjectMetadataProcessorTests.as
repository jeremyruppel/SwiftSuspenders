//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 the original author or authors
// 
////////////////////////////////////////////////////////////////////////////////

package org.swiftsuspenders.processors
{
	import org.flexunit.Assert;
	import org.swiftsuspenders.Injector;
	import org.swiftsuspenders.injectionpoints.InjectionPoint;
	import org.swiftsuspenders.injectionpoints.MethodInjectionPoint;
	import org.swiftsuspenders.injectionpoints.PropertyInjectionPoint;
	import org.swiftsuspenders.processors.IMetadataProcessor;
	import org.swiftsuspenders.processors.impl.InjectMetadataProcessor;
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
	public class InjectMetadataProcessorTests
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
			processor = new InjectMetadataProcessor( );
		}
		
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
	
		[Test(description='provides property injection point for properties')]
		public function test_provides_property_injection_point_for_properties( ) : void
		{
			var node : XML = XML( InjectionNodes.PROPERTY_INJECTION_NODE.metadata );
			
			var point : InjectionPoint = processor.createPropertyInjectionPoint( node, new Injector( ) );
			
			Assert.assertTrue( 'Injection point should be PropertyInjectionPoint', point is PropertyInjectionPoint );
		}
		
		[Test(description='provides method injection point for methods')]
		public function test_provides_method_injection_point_for_methods( ) : void
		{
			var node : XML = XML( InjectionNodes.METHOD_SET_DEPENDENCIES_INJECTION_NODE_TWO_PARAMETER.metadata );
			
			var point : InjectionPoint = processor.createMethodInjectionPoint( node, new Injector( ) );
			
			Assert.assertTrue( 'Injection point should be MethodInjectionPoint', point is MethodInjectionPoint );
		}
		
		[Test(description='post process leaves injection points unchanged')]
		public function test_post_process_leaves_injection_points_unchanged( ) : void
		{
			var points   : Array = [ ];
			var node     : XML;
			var point    : InjectionPoint;
			var injector : Injector = new Injector( );
			
			node = XML( InjectionNodes.PROPERTY_INJECTION_NODE.metadata );
			point = processor.createPropertyInjectionPoint( node, injector );
			points.push( point );
			
			node = XML( InjectionNodes.METHOD_SET_DEPENDENCIES_INJECTION_NODE_TWO_PARAMETER.metadata );
			point = processor.createMethodInjectionPoint( node, injector );
			points.push( point );
			
			Assert.assertTrue( 'Points array should be unchanged', points === processor.postProcessInjectionPoints( points ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function InjectMetadataProcessorTests( )
		{
		}
	
	}

}
