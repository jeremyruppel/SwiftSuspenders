//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2011 the original author or authors
// 
////////////////////////////////////////////////////////////////////////////////

package org.swiftsuspenders.support.processors
{
	import org.swiftsuspenders.Injector;
	import org.swiftsuspenders.injectionpoints.InjectionPoint;
	import org.swiftsuspenders.processors.IMetadataProcessor;

	/**
	 * Trivial example of a metadata processor to inject
	 * an object's own fully-qualified class name into
	 * a given property automatically.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  06.01.2011
	 */
	public class ClassNameMetadataProcessor implements IMetadataProcessor
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function ClassNameMetadataProcessor( )
		{
		}
	
		//---------------------------------------
		// IMetadataProcessor Implementation
		//---------------------------------------

		public function get tagName( ) : String
		{
			return 'ClassName';
		}

		public function createPropertyInjectionPoint( node : XML, injector : Injector ) : InjectionPoint
		{
			return new ClassNamePropertyInjectionPoint( node, injector );
		}

		public function createMethodInjectionPoint( node : XML, injector : Injector ) : InjectionPoint
		{
			return new ClassNameMethodInjectionPoint( node, injector );
		}

		public function postProcessInjectionPoints( injectionPoints : Array ) : Array
		{
			return injectionPoints;
		}

	}

}
