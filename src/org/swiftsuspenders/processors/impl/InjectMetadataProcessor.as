//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 the original author or authors
// 
////////////////////////////////////////////////////////////////////////////////

package org.swiftsuspenders.processors.impl
{
	import org.swiftsuspenders.Injector;
	import org.swiftsuspenders.injectionpoints.InjectionPoint;
	import org.swiftsuspenders.injectionpoints.MethodInjectionPoint;
	import org.swiftsuspenders.injectionpoints.PropertyInjectionPoint;
	import org.swiftsuspenders.processors.IMetadataProcessor;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  06.01.2011
	 */
	public class InjectMetadataProcessor implements IMetadataProcessor
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function InjectMetadataProcessor( )
		{
		}
			
		//---------------------------------------
		// IMetadataProcessor Implementation
		//---------------------------------------

		/**
		 * @inheritDoc
		 */
		public function get tagName( ) : String
		{
			return 'Inject';
		}

		/**
		 * @inheritDoc
		 * @param node XML
		 * @param injector Injector
		 * @return InjectionPoint 
		 */
		public function createPropertyInjectionPoint( node : XML, injector : Injector ) : InjectionPoint
		{
			return new PropertyInjectionPoint( node, injector );
		}

		/**
		 * @inheritDoc
		 * @param node XML
		 * @param injector Injector
		 * @return InjectionPoint 
		 */
		public function createMethodInjectionPoint( node : XML, injector : Injector ) : InjectionPoint
		{
			return new MethodInjectionPoint( node, injector );
		}
	
	}

}