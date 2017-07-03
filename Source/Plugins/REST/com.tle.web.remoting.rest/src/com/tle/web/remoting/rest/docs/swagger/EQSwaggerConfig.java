/*
 * Copyright 2017 Apereo
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.tle.web.remoting.rest.docs.swagger;

import javax.inject.Inject;
import javax.inject.Singleton;

import com.tle.core.guice.Bind;
import com.tle.core.institution.InstitutionService;
import com.wordnik.swagger.config.SwaggerConfig;

@SuppressWarnings("nls")
@Bind
@Singleton
public class EQSwaggerConfig extends SwaggerConfig
{
	@Inject
	private InstitutionService institutionService;

	@Override
	public String basePath()
	{
		return institutionService.institutionalise("api");
	}
}
