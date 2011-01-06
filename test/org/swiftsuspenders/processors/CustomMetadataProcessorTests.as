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
	import org.swiftsuspenders.processors.IMetadataProcessor;
	import org.swiftsuspenders.support.processors.ClassNameMetadataProcessor;
	import org.swiftsuspenders.support.processors.ClassNameMethodInjectee;
	import org.swiftsuspenders.support.processors.ClassNameMethodInjectionPoint;
	import org.swiftsuspenders.support.processors.ClassNamePropertyInjectee;
	import org.swiftsuspenders.support.processors.ClassNamePropertyInjectionPoint;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  06.01.2011
	 */
	public class CustomMetadataProcessorTests
	{
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var injector : Injector;
		
		private var processor : IMetadataProcessor;
		
		private const CLASS_NAME_INJECTION_NODE : XML =
			<variable name="className" type="String">
				<metadata name="ClassName"/>
			</variable>;
		
		private const CLASS_NAME_INJECTION_METHOD : XML =
			<method name="setClassName" declaredBy="org.swiftsuspenders.support.processors::ClassNameMethodInjectee" returnType="void">
		      <parameter index="1" type="String" optional="false"/>
		      <metadata name="ClassName"/>
		    </method>;
		
		//--------------------------------------
		//  SETUP
		//--------------------------------------
		
		[Before]
		public function setup( ) : void
		{
			injector = new Injector( );
			
			processor = new ClassNameMetadataProcessor( );
			
			injector.addMetadataProcessor( processor );
		}

		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
		
		[Test(description='provides class name property injection point for properties')]
		public function test_provides_class_name_property_injection_point_for_properties( ) : void
		{
			var point : InjectionPoint = processor.createPropertyInjectionPoint( XML( CLASS_NAME_INJECTION_NODE.metadata ), injector );
			
			Assert.assertTrue( 'Injection point should be ClassNamePropertyInjectionPoint', 
				point is ClassNamePropertyInjectionPoint );
		}
		
		[Test(description='provides class name method injection point for methods')]
		public function test_provides_class_name_method_injection_point_for_methods( ) : void
		{
			var point : InjectionPoint = processor.createMethodInjectionPoint( XML( CLASS_NAME_INJECTION_METHOD.metadata ), injector );
			
			Assert.assertTrue( 'Injection point should be ClassNameMethodInjectionPoint', 
				point is ClassNameMethodInjectionPoint );
		}
		
		[Test(description='injects class name into property of injectee')]
		public function test_injects_class_name_into_property_of_injectee( ) : void
		{
			var injectee : ClassNamePropertyInjectee = new ClassNamePropertyInjectee( );
			
			injector.injectInto( injectee );
			
			Assert.assertEquals( 'Injectee should receive class name in property', 
				'org.swiftsuspenders.support.processors::ClassNamePropertyInjectee', injectee.className );
		}
		
		[Test(description='injects class name into method of injectee')]
		public function test_injects_class_name_into_method_of_injectee( ) : void
		{
			var injectee : ClassNameMethodInjectee = new ClassNameMethodInjectee( );
			
			injector.injectInto( injectee );
			
			Assert.assertEquals( 'Injectee should have set its own class name property in method',
				'org.swiftsuspenders.support.processors::ClassNameMethodInjectee', injectee.className );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function CustomMetadataProcessorTests( )
		{
		}
	
	}

}
